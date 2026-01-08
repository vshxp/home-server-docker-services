# Sonarr

TV show collection manager.

## Overview

Sonarr is a PVR for Usenet and BitTorrent users. It monitors multiple RSS feeds for new TV show episodes and interfaces with clients and indexers to grab, sort, and rename them. It's part of the *arr stack.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/sonarr:latest` |
| **Container Name** | `sonarr` |
| **Internal Port** | `8989` |
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
| `/Storage/.Docker/sonarr/config` | `/config` | Configuration |
| `/Storage/Media/` | `/Storage/Media` | Media library |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.sonarr.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.sonarr.loadbalancer.server.port=8989
```

## Features

- Automatic episode downloading
- Calendar view
- Series monitoring
- Quality upgrades
- Season pack support
- Failed download handling
- Manual search
- Import lists

## Integration

| Service | Purpose |
|---------|---------|
| **Prowlarr** | Indexer management |
| **qBittorrent/Deluge** | Download client |
| **Emby/Jellyfin** | Media server |
| **Jellyseerr** | Requests |
| **Bazarr** | Subtitles |

## Setup Flow

1. Configure root folder (TV library)
2. Add indexers (or use Prowlarr)
3. Configure download client
4. Set quality profiles
5. Add TV series

## Quality Profiles

Create profiles for:
- **4K**: 4K releases
- **HD-1080p**: 1080p only
- **HD-720p/1080p**: Both acceptable
- **Any**: Best available

## Series Types

| Type | Description |
|------|-------------|
| Standard | Normal TV series |
| Daily | Daily shows (talk shows) |
| Anime | Japanese animation |

## Quick Start

1. Create `.env` file with domain
2. Start the service: `hsds setup`
3. Access via configured domain
4. Configure settings
5. Add TV series

## Adding Series

### Manual Search
1. Click **Add Series**
2. Search by title
3. Select quality profile
4. Choose monitored seasons
5. Add to library

### Import Lists
Import from:
- Trakt lists
- IMDb lists
- TVDb lists

## API Key

Find at **Settings** → **General** → **Security**

Used for:
- Jellyseerr integration
- Prowlarr sync
- External applications

## Episode Naming

Configure naming in **Settings** → **Media Management**

Example: `{Series Title} - S{season:00}E{episode:00} - {Episode Title}`

## Links

- [Official Website](https://sonarr.tv/)
- [Documentation](https://wiki.servarr.com/sonarr)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-sonarr)
