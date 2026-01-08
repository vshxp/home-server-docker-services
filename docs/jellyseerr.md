# Jellyseerr

Media request management for Jellyfin/Emby.

## Overview

Jellyseerr is a request management tool for Jellyfin and Emby users. It allows users to request movies and TV shows, which are then automatically sent to Radarr and Sonarr for downloading. It's a fork of Overseerr with Jellyfin/Emby support.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `fallenbagel/jellyseerr:latest` |
| **Container Name** | `jellyseerr` |
| **Internal Port** | `5055` |
| **Memory Limit** | `512M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `TZ` | Timezone | `America/Sao_Paulo` |
| `JELLYFIN_TYPE` | Media server type | `emby` |
| `PRIVATE_DOMAIN` | Private access domain | Required |
| `PRIVATE_DOMAIN2` | Secondary private domain | Optional |
| `PUBLIC_DOMAIN` | Public access domain | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/jellyseerr/config` | `/app/config` | Configuration |
| `/Storage/Media` | `/Storage/Media` | Media access |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.jellyseerr.rule=Host(`${PRIVATE_DOMAIN}`) || Host(`${PRIVATE_DOMAIN2}`) || Host(`${PUBLIC_DOMAIN}`)
  - traefik.http.services.jellyseerr.loadbalancer.server.port=5055
```

## Features

- Request movies and TV shows
- User management
- Integration with Radarr/Sonarr
- Media availability status
- Request notifications
- Issue reporting
- Discovery recommendations

## Setup Flow

1. Connect to Jellyfin/Emby server
2. Configure Radarr connection
3. Configure Sonarr connection
4. Set up users and permissions
5. Configure notifications (optional)

## Integration Requirements

| Service | Required For |
|---------|-------------|
| **Emby/Jellyfin** | User authentication |
| **Radarr** | Movie requests |
| **Sonarr** | TV show requests |
| **TMDb** | Media metadata |

## Quick Start

1. Create `.env` file with domain variables
2. Start the service: `hsds setup`
3. Access via configured domain
4. Complete setup wizard
5. Import users from media server

## User Permissions

| Permission | Description |
|------------|-------------|
| Request | Can request media |
| Auto-approve | Requests auto-approved |
| Admin | Full access |

## Notifications

Supports:
- Discord webhooks
- Email
- Telegram
- Slack
- Pushover

## Links

- [GitHub Repository](https://github.com/Fallenbagel/jellyseerr)
- [Documentation](https://docs.jellyseerr.dev/)
