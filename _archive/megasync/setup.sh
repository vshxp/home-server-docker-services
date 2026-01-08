#!/bin/bash
# Setup script for MEGAcmd Docker
# Run this once before first docker compose up

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Load .env if exists
if [ -f .env ]; then
    set -a
    source .env
    set +a
fi

PUID="${PUID:-$(id -u)}"
PGID="${PGID:-$(id -g)}"
DATA_PATH="${MEGA_DATA_PATH:-./data}"

echo "=== MEGAcmd Setup ==="
echo "PUID: $PUID"
echo "PGID: $PGID"
echo "Data path: $DATA_PATH"

# Configure inotify watches for large file syncs
REQUIRED_WATCHES=1048576
CURRENT_WATCHES=$(cat /proc/sys/fs/inotify/max_user_watches 2>/dev/null || echo "0")
SYSCTL_FILE="/etc/sysctl.d/99-megasync.conf"

if [ "$CURRENT_WATCHES" -lt "$REQUIRED_WATCHES" ]; then
    echo ""
    echo "=== Configuring inotify watches ==="
    echo "Current: $CURRENT_WATCHES | Required: $REQUIRED_WATCHES"

    if [ ! -f "$SYSCTL_FILE" ] || ! grep -q "max_user_watches=$REQUIRED_WATCHES" "$SYSCTL_FILE" 2>/dev/null; then
        echo "Creating $SYSCTL_FILE (requires sudo)..."
        echo "fs.inotify.max_user_watches=$REQUIRED_WATCHES" | sudo tee "$SYSCTL_FILE" > /dev/null
        echo "fs.inotify.max_user_instances=512" | sudo tee -a "$SYSCTL_FILE" > /dev/null
    fi

    echo "Applying sysctl settings..."
    sudo sysctl -p "$SYSCTL_FILE"
    echo "✓ inotify watches configured: $REQUIRED_WATCHES"
else
    echo "✓ inotify watches OK: $CURRENT_WATCHES"
fi

# Create data directory if it doesn't exist
mkdir -p "$DATA_PATH"

# Fix permissions using Docker (no sudo required)
CURRENT_OWNER=$(stat -c '%u' "$DATA_PATH" 2>/dev/null || echo "0")
if [ "$CURRENT_OWNER" != "$PUID" ]; then
    echo "Fixing permissions on $DATA_PATH..."
    docker run --rm -v "$(realpath "$DATA_PATH")":/data alpine chown -R "$PUID:$PGID" /data
fi
echo "✓ Data directory ready: $DATA_PATH"

# Build the image
echo "Building Docker image..."
docker compose build

echo ""
echo "=== Setup Complete ==="

echo "Initializing MEGAcmd container..."
docker compose up -d
