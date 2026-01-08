# qBittorrent

Free and open-source BitTorrent client.

## Overview

qBittorrent is a cross-platform free and open-source BitTorrent client. It aims to provide a good alternative to uTorrent with a similar look and feature set, but without ads and with better privacy.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/qbittorrent:latest` |
| **Container Name** | `qbittorrent` |
| **Web UI Port** | `8082` (mapped from 8080) |
| **Torrent Port** | `6881` |
| **Memory Limit** | `2048M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `GIDLIST` | Additional groups | `100` |
| `UMASK_SET` | File permissions mask | `022` |
| `WEBUI_PORT` | Internal web UI port | `8080` |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/qbittorrent/config` | `/config` | Configuration |
| `/Storage/Media/downloads/torrent` | `/Storage/Media/downloads/torrent` | Downloads |

## Ports

| Host | Container | Purpose |
|------|-----------|---------|
| `8082` | `8080` | Web UI |
| `6881` | `6881` | BitTorrent (TCP/UDP) |

## Default Credentials

Check container logs for initial password:
```bash
docker logs qbittorrent
```

- **Username**: `admin`
- **Password**: Random (check logs)

## Features

- Web-based interface
- RSS feed support
- IP filtering
- DHT, PeX, LSD
- Sequential downloading
- Bandwidth scheduling
- Search plugins
- Category management

## Integration with *arr Stack

Configure qBittorrent as download client:

### In Sonarr/Radarr
- **Host**: `qbittorrent`
- **Port**: `8082`
- **Username**: `admin`
- **Password**: Your configured password
- **Category**: `sonarr` or `radarr`

## Category Setup

Create categories for automation:
1. **sonarr** - TV shows
2. **radarr** - Movies
3. **lidarr** - Music

## Quick Start

1. Start the service: `hsds setup`
2. Get password from logs
3. Access at `http://<host>:8082`
4. Change default password
5. Configure categories

## Web UI Settings

Recommended settings:
- **Downloads** → Set default save path
- **Connection** → Configure port forwarding
- **Speed** → Set bandwidth limits
- **Web UI** → Change password

## Advanced Features

### Search Plugins
Install search plugins for torrent sites:
- Settings → Search → Search plugins

### RSS Feeds
Automate downloads via RSS:
- RSS → Add feed URL
- Configure download rules

## Links

- [Official Website](https://www.qbittorrent.org/)
- [Documentation](https://github.com/qbittorrent/qBittorrent/wiki)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-qbittorrent)
