# TubeSync

YouTube channel and playlist synchronization.

## Overview

TubeSync is a PVR (Personal Video Recorder) for YouTube. It synchronizes YouTube channels and playlists, automatically downloading new videos as they are released.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `ghcr.io/meeb/tubesync:latest` |
| **Container Name** | `tubesync` |
| **Internal Port** | `4848` |
| **Memory Limit** | `512M` |
| **Network** | `services` (external) |
| **Restart Policy** | `always` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `HTTP_USER` | Web UI username | Required |
| `HTTP_PASS` | Web UI password | Required |
| `TUBESYNC_WORKERS` | Download workers | Required |
| `PRIVATE_DOMAIN` | Domain for Traefik | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/tubesync/config` | `/config` | Configuration |
| `/Storage/Media/tubesync` | `/downloads` | Downloaded videos |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.tubesync.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.tubesync.loadbalancer.server.port=4848
```

## Features

- Channel synchronization
- Playlist synchronization
- Quality selection
- Format selection
- Scheduling
- Metadata downloading
- SponsorBlock integration

## Quick Start

1. Create `.env` file:
   ```bash
   HTTP_USER=admin
   HTTP_PASS=secure_password
   TUBESYNC_WORKERS=2
   PRIVATE_DOMAIN=tubesync.local
   ```
2. Start the service: `hsds setup`
3. Access via configured domain
4. Add sources (channels/playlists)

## Adding Sources

### Channel
1. Click **Add Source**
2. Select **YouTube Channel**
3. Enter channel URL or ID
4. Configure options
5. Save

### Playlist
1. Click **Add Source**
2. Select **YouTube Playlist**
3. Enter playlist URL
4. Configure options
5. Save

## Quality Options

| Quality | Description |
|---------|-------------|
| Best | Highest available |
| 4K | 2160p if available |
| 1080p | Full HD |
| 720p | HD |
| 480p | SD |
| Audio | Audio only |

## Format Options

- Video: MP4, MKV, WebM
- Audio: MP3, M4A, Opus

## Scheduling

Configure sync frequency:
- Hours between checks
- Download limits
- Time windows

## Workers

Set `TUBESYNC_WORKERS` based on:
- Available bandwidth
- Storage speed
- CPU power

Recommended: 1-4 workers

## Use Cases

- Archive favorite channels
- Download educational content
- Backup music playlists
- Offline viewing collection

## Integration

Downloaded videos work with:
- Plex/Emby/Jellyfin
- Kodi
- Any media player

## Links

- [GitHub Repository](https://github.com/meeb/tubesync)
- [Documentation](https://github.com/meeb/tubesync#readme)
