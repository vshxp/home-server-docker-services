# Lidarr

Music collection manager for Usenet and BitTorrent.

## Overview

Lidarr is a music collection manager for Usenet and BitTorrent users. It monitors multiple RSS feeds for new albums from your favorite artists and interfaces with clients and indexers to grab, sort, and rename them.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/lidarr:latest` |
| **Container Name** | `lidarr` |
| **Internal Port** | `8686` |
| **Memory Limit** | `2048M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `TZ` | Timezone | `America/Sao_Paulo` |
| `PRIVATE_DOMAIN` | Domain for Traefik | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/lidarr/config` | `/config` | Configuration |
| `/Storage/Media/` | `/Storage/Media` | Music library |
| `/Storage/Media/downloads/complete` | - | Completed downloads |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.lidarr.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.lidarr.loadbalancer.server.port=8686
```

## Features

- Artist and album monitoring
- Automatic quality upgrades
- Calendar for upcoming releases
- Manual search
- Failed download handling
- Metadata importing
- Integration with download clients

## Integration

| Service | Purpose |
|---------|---------|
| **Prowlarr** | Indexer management |
| **Download Client** | Torrent/Usenet downloads |
| **Plex/Emby/Jellyfin** | Library notifications |

## Setup Flow

1. Configure media folders
2. Add indexers (or use Prowlarr)
3. Configure download client
4. Add artists to monitor
5. Set quality profiles

## Quality Profiles

Create profiles for:
- FLAC (lossless)
- MP3 320kbps
- AAC
- Mixed formats

## Quick Start

1. Create `.env` file with domain variable
2. Start the service: `hsds setup`
3. Access via configured domain
4. Configure root folder (music library)
5. Add artists via search

## Metadata Agents

Supported metadata sources:
- MusicBrainz
- Last.fm
- Fanart.tv

## Links

- [Official Website](https://lidarr.audio/)
- [Documentation](https://wiki.servarr.com/lidarr)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-lidarr)
