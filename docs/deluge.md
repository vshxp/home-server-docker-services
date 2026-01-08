# Deluge

Lightweight, cross-platform BitTorrent client.

## Overview

Deluge is a full-featured BitTorrent client with a web interface, daemon mode, and extensive plugin support. It offers a clean interface and excellent performance for torrent downloading.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/deluge:latest` |
| **Container Name** | `deluge` |
| **Web UI Port** | `8112` |
| **Torrent Port** | `6881` (TCP/UDP) |
| **Daemon Port** | `58846` (optional) |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID for file permissions | `1000` |
| `PGID` | Group ID for file permissions | `1000` |
| `TZ` | Timezone | `America/Sao_Paulo` |
| `DELUGE_LOGLEVEL` | Log verbosity | `error` |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/deluge/config` | `/config` | Configuration files |
| `/Storage/Media` | `/downloads` | Download directory |

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `8112` | TCP | Web UI |
| `6881` | TCP/UDP | BitTorrent traffic |
| `58846` | TCP | Remote daemon access |

## Default Credentials

- **Username**: `admin`
- **Password**: `deluge`

Change these immediately after first login.

## Features

- Web-based interface
- Plugin system (labels, scheduler, blocklist)
- Remote access via thin client
- Bandwidth scheduling
- IP filtering

## Quick Start

1. Start the service: `hsds setup`
2. Access web UI at `http://<host>:8112`
3. Login with default credentials
4. Change password in **Preferences** > **Interface**

## Integration with *arr Stack

Configure Deluge as download client in Sonarr/Radarr:
- **Host**: `deluge` (container name)
- **Port**: `8112`
- **Password**: Your configured password

## Links

- [Official Website](https://deluge-torrent.org/)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-deluge)
