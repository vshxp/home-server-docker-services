# Bazarr

Subtitle management companion for Sonarr and Radarr.

## Overview

Bazarr is a companion application to Sonarr and Radarr that manages and downloads subtitles based on your requirements. It automatically searches for missing subtitles and downloads them for your media library.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/bazarr:latest` |
| **Container Name** | `bazarr` |
| **Web UI Port** | `6767` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID for file permissions | `1000` |
| `PGID` | Group ID for file permissions | `1000` |
| `TZ` | Timezone | `America/Sao_Paulo` |
| `DOMAIN_NAME` | Domain for Traefik routing | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/bazarr/config` | `/config` | Configuration files |
| `/Storage/Media/tv-shows` | `/Storage/Media/tv-shows` | TV shows library |
| `/Storage/Media/movies` | `/Storage/Media/movies` | Movies library |

## Traefik Integration

This service is configured for Traefik reverse proxy:

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.bazarr.rule=Host(`${DOMAIN_NAME}`)
  - traefik.http.services.bazarr.loadbalancer.server.port=6767
```

## Integration

- **Sonarr**: Connect for TV show subtitle management
- **Radarr**: Connect for movie subtitle management
- **Emby/Jellyfin**: Subtitles are stored alongside media files

## Quick Start

1. Create `.env` file with required variables
2. Start the service: `hsds setup`
3. Access web UI at `http://<host>:6767` or via Traefik domain
4. Configure Sonarr/Radarr connections in settings

## Links

- [Official Documentation](https://wiki.bazarr.media/)
- [GitHub Repository](https://github.com/morpheus65535/bazarr)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-bazarr)
