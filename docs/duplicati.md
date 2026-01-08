# Duplicati

Free backup solution with cloud storage support.

## Overview

Duplicati is a free, open-source backup client that stores encrypted, incremental, compressed backups on cloud storage services and remote file servers. It works with various backends including S3, Google Drive, OneDrive, and local storage.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/duplicati:latest` |
| **Container Name** | `duplicati` |
| **Web UI Port** | `8200` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID for file permissions | `1000` |
| `PGID` | Group ID for file permissions | `1000` |
| `TZ` | Timezone | `America/Sao_Paulo` |
| `SETTINGS_ENCRYPTION_KEY` | Key to encrypt settings database | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/duplicati/config` | `/config` | Configuration database |
| `/Storage/Backups/Cloud` | `/backups` | Backup destination |
| `/Storage/Backups/immich` | `/backup/immich` | Source: Immich backups |
| `/Storage/Backups/syncthing` | `/backup/syncthing` | Source: Syncthing backups |
| `/Storage/Backups/proxmox` | `/backup/proxmox` | Source: Proxmox backups |

## Features

- Client-side encryption (AES-256)
- Incremental backups
- Deduplication
- Compression
- Scheduled backups
- Multiple cloud backends
- Web-based interface

## Supported Backends

- Local folder/NAS
- Amazon S3 (and compatible)
- Google Drive
- Microsoft OneDrive
- Backblaze B2
- SFTP/FTP
- WebDAV
- And many more

## Quick Start

1. Create `.env` file:
   ```bash
   SETTINGS_ENCRYPTION_KEY=$(openssl rand -base64 32)
   ```
2. Start the service: `hsds setup`
3. Access web UI at `http://<host>:8200`
4. Create backup jobs in the web interface

## Best Practices

- Always encrypt backups
- Test restore procedures regularly
- Keep multiple backup versions
- Use 3-2-1 backup rule (3 copies, 2 media types, 1 offsite)

## Links

- [Official Website](https://www.duplicati.com/)
- [Documentation](https://duplicati.readthedocs.io/)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-duplicati)
