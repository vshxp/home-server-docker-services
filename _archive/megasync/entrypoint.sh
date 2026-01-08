#!/bin/bash
set -e

mkdir -p /home/megauser/.megaCmd /data

if [ ! -e /data/.megaignore ]; then
    cat > /data/.megaignore <<'EOF'
-:Thumbs.db
-:desktop.ini
-:~*
-:.*
-:*~.*
-:*.crdownload
-:*.sb-????????-??????
-:*.tmp
-:.venv
-:venv
-:node_modules
-:__pycache__
EOF
fi

if [ ! -w /data ] || [ ! -w /data/.megaignore ]; then
    echo "ERROR: /data is not writable by uid=$(id -u) gid=$(id -g)." >&2
    echo "Set MEGA_DATA_PATH to a writable host folder and/or set PUID/PGID to match its owner." >&2
    echo "Example: MEGA_DATA_PATH=/mnt/storage/Sync PUID=$(id -u) PGID=$(id -g)" >&2
    exit 1
fi

# Start mega-cmd-server in background
mega-cmd-server &

# Wait for server to be ready
sleep 3

# Check if already logged in
if mega-whoami &>/dev/null; then
    echo "Already logged in as $(mega-whoami 2>/dev/null | grep -oP 'Account e-mail: \K.*')"
    LOGGED_IN=true
elif [ -n "$MEGA_EMAIL" ] && [ -n "$MEGA_PASSWORD" ]; then
    echo "Logging in to MEGA..."
    if mega-login "$MEGA_EMAIL" "$MEGA_PASSWORD"; then
        echo "Login successful!"
        LOGGED_IN=true
    else
        echo "Login failed!"
        LOGGED_IN=false
    fi
else
    echo "No credentials provided. Manual login required."
    LOGGED_IN=false
fi

# Setup bidirectional sync if logged in and paths are configured
if [ "$LOGGED_IN" = true ] && [ -n "$MEGA_SYNC_LOCAL" ] && [ -n "$MEGA_SYNC_REMOTE" ]; then
    # Check if sync already exists
    if mega-sync 2>/dev/null | grep -q "$MEGA_SYNC_LOCAL"; then
        echo "Sync already configured for $MEGA_SYNC_LOCAL"

        # Check if sync is disabled and re-enable it
        if mega-sync 2>/dev/null | grep -q "Disabled"; then
            echo "Sync is disabled, attempting to re-enable..."
            mega-sync -e "$MEGA_SYNC_LOCAL" "$MEGA_SYNC_REMOTE" 2>/dev/null && \
                echo "Sync re-enabled successfully!" || \
                echo "WARNING: Could not re-enable sync. Check inotify limits on host."
        fi
    else
        echo "Setting up bidirectional sync..."
        echo "  Local:  $MEGA_SYNC_LOCAL"
        echo "  Remote: $MEGA_SYNC_REMOTE"

        # Create local directory if it doesn't exist
        mkdir -p "$MEGA_SYNC_LOCAL"

        # Setup sync (mega-sync is bidirectional by default)
        if mega-sync "$MEGA_SYNC_LOCAL" "$MEGA_SYNC_REMOTE"; then
            echo "Sync configured successfully!"
        else
            echo "Sync setup failed! Check permissions on $MEGA_SYNC_LOCAL"
        fi
    fi
fi

# Execute command or keep container running
if [ $# -gt 0 ]; then
    exec "$@"
else
    echo "MEGAcmd running. Use 'docker compose exec megacmd mega-sync' to check sync status."
    # Keep container running
    tail -f /dev/null
fi
