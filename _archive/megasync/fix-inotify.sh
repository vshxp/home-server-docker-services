#!/bin/bash
# Quick fix for inotify watches limit
# Run with: sudo ./fix-inotify.sh

set -e

REQUIRED_WATCHES=1048576
SYSCTL_FILE="/etc/sysctl.d/99-megasync.conf"

echo "=== Fixing inotify watches ==="

# Create sysctl config
echo "Creating $SYSCTL_FILE..."
cat > "$SYSCTL_FILE" <<EOF
# MEGAsync - Increase inotify limits for large file syncs
fs.inotify.max_user_watches=$REQUIRED_WATCHES
fs.inotify.max_user_instances=512
EOF

# Apply immediately
sysctl -p "$SYSCTL_FILE"

echo "✓ inotify watches set to $REQUIRED_WATCHES"
echo ""
echo "Now re-enabling MEGA sync..."
docker exec megacmd mega-sync -e /data / 2>/dev/null || docker exec megacmd mega-sync -r /data / 2>/dev/null && docker exec megacmd mega-sync /data /

echo ""
echo "Checking sync status..."
docker exec megacmd mega-sync
