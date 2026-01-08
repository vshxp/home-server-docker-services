# JDownloader2

Multi-hoster download manager.

## Overview

JDownloader2 is a free, open-source download manager that supports downloading from hundreds of file hosting services. It features automatic CAPTCHA solving, link decryption, and a web interface for remote management.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `jlesage/jdownloader-2` |
| **Container Name** | `jdownloader2` |
| **Web UI Port** | `5800` |
| **Memory Limit** | `1024M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PRIVATE_DOMAIN` | Private access domain | Required |
| `PUBLIC_DOMAIN` | Public access domain | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/jdownloader2/config` | `/config` | Configuration |
| `/Storage/Media/downloads/http` | `/output` | Download directory |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.jdownloader.rule=Host(`${PRIVATE_DOMAIN}`) || Host(`${PUBLIC_DOMAIN}`)
  - traefik.http.services.jdownloader.loadbalancer.server.port=5800
```

## Features

- 300+ hoster support
- Automatic CAPTCHA solving
- Link containers (DLC, CCF, RSDF)
- Download scheduling
- Bandwidth management
- Premium account support
- Browser extensions

## Web Interface

The container provides a web-based VNC interface:
- Access via browser at port 5800
- Full JDownloader GUI in browser
- Clipboard integration

## MyJDownloader

For remote access:
1. Create account at [my.jdownloader.org](https://my.jdownloader.org/)
2. Configure credentials in JDownloader settings
3. Access from anywhere via web/mobile apps

## Quick Start

1. Create `.env` file with domain variables
2. Start the service: `hsds setup`
3. Access web UI via Traefik domain
4. Configure MyJDownloader (optional)
5. Add download links

## Browser Extensions

Install browser extension to send links directly to JDownloader:
- Chrome/Firefox: JDownloader Browser Extension

## Supported Hosters

- Mega.nz
- Google Drive
- Dropbox
- MediaFire
- RapidGator
- And 300+ more

## Links

- [Official Website](https://jdownloader.org/)
- [Docker Image Docs](https://github.com/jlesage/docker-jdownloader-2)
- [MyJDownloader](https://my.jdownloader.org/)
