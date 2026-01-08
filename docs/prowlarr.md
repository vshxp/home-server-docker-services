# Prowlarr

Indexer manager for *arr applications.

## Overview

Prowlarr is an indexer manager/proxy that integrates with various PVR apps (Sonarr, Radarr, Lidarr). It manages your indexers in one place and syncs them to all connected applications automatically.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/prowlarr:latest` |
| **Container Name** | `prowlarr` |
| **Internal Port** | `9696` |
| **Memory Limit** | `256M` |
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
| `/Storage/.Docker/prowlarr/config` | `/config` | Configuration |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.prowlarr.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.prowlarr.loadbalancer.server.port=9696
```

## Features

- Centralized indexer management
- Automatic sync to *arr apps
- Usenet and torrent indexer support
- Search all indexers at once
- History and statistics
- Cardigann support (custom indexers)

## Supported Indexers

### Torrent
- Public trackers
- Private trackers
- Cardigann definitions

### Usenet
- NZBGeek
- DogNZB
- NZBFinder
- And more

## Integration

Connect Prowlarr to:

| Application | Purpose |
|-------------|---------|
| **Sonarr** | TV shows |
| **Radarr** | Movies |
| **Lidarr** | Music |
| **Readarr** | Books |

## Setup Flow

1. Add indexers in Prowlarr
2. Configure applications (Sonarr, Radarr, etc.)
3. Prowlarr syncs indexers automatically
4. Search from any connected app

## Adding Applications

In Prowlarr:
1. Go to **Settings** → **Apps**
2. Add Sonarr/Radarr/etc.
3. Enter API key and URL
4. Test and save

## Quick Start

1. Create `.env` file with domain
2. Start the service: `hsds setup`
3. Access via configured domain
4. Add indexers
5. Connect to *arr applications

## Flaresolverr

For Cloudflare-protected indexers:
```yaml
services:
  flaresolverr:
    image: ghcr.io/flaresolverr/flaresolverr:latest
```

Configure in **Settings** → **Indexers** → **FlareSolverr**

## Links

- [Official Website](https://prowlarr.com/)
- [Documentation](https://wiki.servarr.com/prowlarr)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-prowlarr)
