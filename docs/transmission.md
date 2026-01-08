# Transmission

Lightweight BitTorrent client.

## Overview

Transmission is a fast, easy, and free BitTorrent client. It's known for its low resource usage and clean interface, making it ideal for servers.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/transmission:latest` |
| **Container Name** | `transmission` |
| **Web UI Port** | `9091` |
| **Torrent Port** | `51413` |
| **Memory Limit** | `2048M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `TZ` | Timezone | `America/Sao_Paulo` |
| `USER` | Web UI username | Required |
| `PASS` | Web UI password | Required |
| `PRIVATE_DOMAIN` | Domain for Traefik | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/transmission/data` | `/config` | Configuration |
| `/Storage/Media/downloads/torrent` | `/Storage/Media/downloads/torrent` | Downloads |
| `/etc/localtime` | `/etc/localtime:ro` | System time |

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `9091` | TCP | Web UI |
| `51413` | TCP/UDP | BitTorrent |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.transmission.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.transmission.loadbalancer.server.port=9091
```

## Features

- Lightweight and fast
- Web-based interface
- Remote GUI support
- Blocklist support
- Magnet link support
- Selective downloading
- Per-torrent options

## Quick Start

1. Create `.env` file:
   ```bash
   USER=admin
   PASS=secure_password
   PRIVATE_DOMAIN=transmission.local
   ```
2. Start the service: `hsds setup`
3. Access via configured domain
4. Login with configured credentials

## Integration with *arr Stack

Configure as download client in Sonarr/Radarr:
- **Host**: `transmission`
- **Port**: `9091`
- **Username**: Your configured user
- **Password**: Your configured password

## Settings Configuration

Edit `settings.json` in config volume for advanced settings:
- Speed limits
- Queue settings
- Peer settings
- Directory configuration

## Remote GUI

Use Transmission Remote GUI clients:
- Windows: Transmission Remote
- macOS: Transmission Remote GUI
- Mobile: Transdroid (Android)

## Watch Directory

Set up watch folder for automatic additions:
```json
{
  "watch-dir": "/downloads/watch",
  "watch-dir-enabled": true
}
```

## Blocklists

Enable blocklists for privacy:
```json
{
  "blocklist-enabled": true,
  "blocklist-url": "http://list.iblocklist.com/..."
}
```

## Links

- [Official Website](https://transmissionbt.com/)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-transmission)
