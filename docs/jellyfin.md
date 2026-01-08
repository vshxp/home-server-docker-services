# Jellyfin

Free software media system.

## Overview

Jellyfin is a free, open-source media server alternative to Emby and Plex. It enables you to collect, manage, and stream your media with no subscription fees, premium features locked behind paywalls, or tracking.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/jellyfin:latest` |
| **Container Name** | `jellyfin` |
| **Web UI Port** | `8097` (mapped from 8096) |
| **HTTPS Port** | `8920` |
| **Memory Limit** | `4096M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `TZ` | Timezone | `America/Sao_Paulo` |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/jellyfin/config` | `/config` | Configuration |
| `/Storage/Media` | `/Media` | Media library |

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `8097` | TCP | Web UI (HTTP) |
| `8920` | TCP | Web UI (HTTPS) |
| `7359` | UDP | Client discovery |
| `1900` | UDP | DLNA |

## Features

- Completely free and open-source
- No tracking or data collection
- Live TV & DVR support
- Hardware transcoding
- Plugins and themes
- Mobile apps
- Multi-user support

## Hardware Transcoding

Add device for hardware acceleration:
```yaml
devices:
  - /dev/dri:/dev/dri  # Intel QuickSync/VAAPI
```

For NVIDIA:
```yaml
runtime: nvidia
environment:
  - NVIDIA_VISIBLE_DEVICES=all
```

## Quick Start

1. Start the service: `hsds setup`
2. Access at `http://<host>:8097`
3. Complete setup wizard
4. Add media libraries
5. Install client apps

## Client Applications

- Web browser
- Android/iOS apps
- Android TV/Fire TV
- Roku
- Kodi plugin
- Desktop apps

## Integration

Works well with:
- **Sonarr/Radarr**: Automatic media management
- **Jellyseerr**: Request management
- **Bazarr**: Subtitle management

## Comparison with Emby

| Feature | Jellyfin | Emby |
|---------|----------|------|
| Cost | Free | Freemium |
| Open Source | Yes | Partial |
| Hardware Transcoding | Free | Premium |
| Live TV | Free | Premium |

## Links

- [Official Website](https://jellyfin.org/)
- [Documentation](https://jellyfin.org/docs/)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-jellyfin)
