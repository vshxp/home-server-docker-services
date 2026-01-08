# Syncthing

Continuous file synchronization.

## Overview

Syncthing is a continuous file synchronization program that synchronizes files between two or more computers in real time. It's decentralized, secure, and private - your data stays on your devices.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/syncthing:latest` |
| **Container Name** | `syncthing` |
| **Web UI Port** | `8384` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `TZ` | Timezone | `America/Sao_Paulo` |
| `USER_01` | First user folder | Required |
| `USER_02` | Second user folder | Required |

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `8384` | TCP | Web UI |
| `22000` | TCP/UDP | Sync protocol |
| `21027` | UDP | Discovery |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/syncthing/config` | `/config` | Configuration |
| `/Storage/Sync/${USER_01}` | `/data/${USER_01}` | User 1 sync folder |
| `/Storage/Sync/${USER_02}` | `/data/${USER_02}` | User 2 sync folder |

## Features

- Real-time synchronization
- End-to-end encryption
- No central server
- Version control
- Conflict handling
- Selective sync
- Cross-platform

## How It Works

```
Device A ←→ Device B ←→ Device C
    ↓           ↓           ↓
  Files       Files       Files
```

All devices sync directly with each other.

## Quick Start

1. Create `.env` file with user variables
2. Start the service: `hsds setup`
3. Access web UI at `http://<host>:8384`
4. Note the Device ID
5. Add remote devices

## Adding Devices

1. Get Device ID from remote device
2. **Add Remote Device** in web UI
3. Accept on remote device
4. Share folders

## Sharing Folders

1. Click on folder
2. **Edit** → **Sharing**
3. Select devices to share with
4. Save

## Ignore Patterns

Create `.stignore` file in sync folder:
```
// Ignore temporary files
*.tmp
*.temp
~*

// Ignore directories
.git
node_modules
```

## Security

- TLS encryption for all transfers
- Device authentication via IDs
- No account required
- Data never touches third-party servers

## Use Cases

- Sync documents between computers
- Backup phone photos
- Share files with family
- Team file sharing
- Offsite backup

## Mobile Apps

- Syncthing Android (F-Droid/Play Store)
- Möbius Sync (iOS, third-party)

## Links

- [Official Website](https://syncthing.net/)
- [Documentation](https://docs.syncthing.net/)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-syncthing)
