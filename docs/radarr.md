# Radarr

Movie collection manager.

## Overview

Radarr is a movie collection manager for Usenet and BitTorrent users. It monitors multiple RSS feeds for new movies and interfaces with clients and indexers to grab, sort, and rename them. It's part of the *arr stack.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/radarr:latest` |
| **Container Name** | `radarr` |
| **Internal Port** | `7878` |
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
| `/Storage/.Docker/radarr/config` | `/config` | Configuration |
| `/Storage/Media/` | `/Storage/Media` | Media library |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.radarr.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.radarr.loadbalancer.server.port=7878
```

## Features

- Automatic movie downloading
- Quality upgrades
- Release profiles
- Custom formats
- Failed download handling
- Calendar view
- Manual search
- List integration (IMDb, Trakt)

## Integration

| Service | Purpose |
|---------|---------|
| **Prowlarr** | Indexer management |
| **qBittorrent/Deluge** | Download client |
| **Emby/Jellyfin** | Media server |
| **Jellyseerr** | Requests |
| **Bazarr** | Subtitles |

## Setup Flow

1. Configure root folder (movie library)
2. Add indexers (or use Prowlarr)
3. Configure download client
4. Set quality profiles
5. Add movies

## Quality Profiles

Create profiles for different quality needs:
- **4K**: 4K releases only
- **HD**: 1080p/720p
- **Any**: Best available

## Custom Formats

Score releases based on:
- Audio formats (Atmos, TrueHD)
- Video codecs (x265, HDR)
- Release groups
- Source quality

## Quick Start

1. Create `.env` file with domain
2. Start the service: `hsds setup`
3. Access via configured domain
4. Configure settings (root folder, indexers, clients)
5. Add movies via search or lists

## Adding Movies

### Manual Search
1. Click **Add Movie**
2. Search by title
3. Select quality profile
4. Add to library

### Lists
Import from:
- IMDb lists
- Trakt lists
- TMDb popular/recommendations

## API Key

Find at **Settings** → **General** → **Security**

Used for:
- Jellyseerr integration
- Prowlarr sync
- External applications

## Links

- [Official Website](https://radarr.video/)
- [Documentation](https://wiki.servarr.com/radarr)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-radarr)
