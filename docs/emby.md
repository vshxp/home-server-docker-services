# Emby

Media server for personal streaming.

## Overview

Emby is a personal media server that organizes video, music, live TV, and photos from personal media libraries and streams them to smart TVs, streaming boxes, and mobile devices. It provides a beautiful interface and integrates with the *arr stack.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/emby:latest` |
| **Container Name** | `emby-server` |
| **Web UI Port** | `8096` |
| **Memory Limit** | `4096M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID for file permissions | `1000` |
| `PGID` | Group ID for file permissions | `1000` |
| `PRIVATE_DOMAIN` | Private access domain | Required |
| `PUBLIC_DOMAIN` | Public access domain | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/emby/data` | `/var/lib/emby` | Emby database |
| `/Storage/.Docker/emby/config` | `/config` | Configuration files |
| `/Storage/Media` | `/Storage/Media` | Media library |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.embyserver.rule=Host(`${PRIVATE_DOMAIN}`) || Host(`${PUBLIC_DOMAIN}`)
  - traefik.http.services.embyserver.loadbalancer.server.port=8096
```

## Features

- Live TV & DVR support
- Parental controls
- User management
- Mobile sync
- Hardware transcoding
- DLNA support
- Plugin system

## Integration with *arr Stack

| Service | Integration |
|---------|-------------|
| **Jellyseerr** | Request management |
| **Sonarr** | TV show library |
| **Radarr** | Movie library |
| **Bazarr** | Subtitle management |

## Hardware Transcoding

For hardware transcoding, add device access:
```yaml
devices:
  - /dev/dri:/dev/dri  # Intel QuickSync
```

## Quick Start

1. Create `.env` file with domain variables
2. Start the service: `hsds setup`
3. Access at `http://<host>:8096` or via Traefik
4. Complete initial setup wizard
5. Add media libraries

## Client Apps

- Emby apps available for iOS, Android, TV platforms
- Web interface for browser access
- Kodi plugin available

## Links

- [Official Website](https://emby.media/)
- [Documentation](https://support.emby.media/)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-emby)
