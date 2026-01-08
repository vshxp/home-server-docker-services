# MeTube

YouTube downloader web interface.

## Overview

MeTube is a web-based GUI for youtube-dl/yt-dlp. It allows you to easily download videos and audio from YouTube and other supported sites with a clean, simple interface.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `ghcr.io/alexta69/metube` |
| **Container Name** | `metube` |
| **Internal Port** | `8081` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

Configure via `.env` file:
- `DOMAIN_NAME` - Domain for Traefik routing
- Additional yt-dlp options can be set

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/Media/metube` | `/downloads` | Downloaded files |
| `/Storage/.Docker/metube/config` | `/app/config` | Configuration |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.metube.rule=Host(`${DOMAIN_NAME}`)
  - traefik.http.services.metube.loadbalancer.server.port=8081
```

## Features

- Simple web interface
- Download videos in various qualities
- Audio extraction (MP3, etc.)
- Playlist support
- Queue management
- Custom output templates

## Supported Sites

MeTube supports all sites that yt-dlp supports:
- YouTube
- Vimeo
- SoundCloud
- Twitter
- TikTok
- And 1000+ more

## Usage

1. Copy video URL
2. Paste into MeTube
3. Select quality/format
4. Click download
5. Files appear in downloads folder

## Configuration Options

Environment variables for yt-dlp:
```yaml
environment:
  - OUTPUT_TEMPLATE=%(title)s.%(ext)s
  - YTDL_OPTIONS={"format":"best"}
```

## Browser Bookmarklet

Add a bookmarklet to send videos directly:
```javascript
javascript:window.open('https://metube.local/add?url='+location.href)
```

## Quick Start

1. Create `.env` file with domain
2. Start the service: `hsds setup`
3. Access via configured domain
4. Paste URLs and download

## Links

- [GitHub Repository](https://github.com/alexta69/metube)
- [yt-dlp Documentation](https://github.com/yt-dlp/yt-dlp)
