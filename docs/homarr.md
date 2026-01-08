# Homarr

Customizable dashboard for your home server.

## Overview

Homarr is a sleek, modern dashboard that allows you to organize all your services in one place. It provides a beautiful interface with widgets, Docker integration, and customizable layouts.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `ghcr.io/ajnart/homarr:latest` |
| **Container Name** | `homarr` |
| **Web UI Port** | `7575` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `uid` | User ID for file permissions | `1000` |
| `gid` | Group ID for file permissions | `1000` |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/homarr/configs` | `/app/data/configs` | Dashboard configurations |
| `/Storage/.Docker/homarr/data` | `/data` | Application data |
| `/Storage/.Docker/homarr/icons` | `/app/public/icons` | Custom icons |
| `/var/run/docker.sock` | `/var/run/docker.sock` | Docker integration |

## Features

- Docker container integration
- Customizable widgets (weather, calendar, RSS)
- Service health monitoring
- Drag-and-drop layout editor
- Multiple dashboards
- Dark/light themes
- Custom icons support

## Widgets

- **App shortcuts**: Quick access to services
- **Calendar**: Event integration
- **Weather**: Local weather display
- **Docker stats**: Container monitoring
- **Torrent**: Download monitoring
- **Media**: *arr stack integration

## Quick Start

1. Start the service: `hsds setup`
2. Access at `http://<host>:7575`
3. Click **Edit Mode** to customize
4. Add services and widgets
5. Organize with drag-and-drop

## Docker Integration

Mount Docker socket for features:
- Container status display
- Start/stop containers
- Resource monitoring
- Health checks

## Custom Icons

Add custom icons to `/Storage/.Docker/homarr/icons/` and they'll be available in the dashboard.

## Links

- [Official Website](https://homarr.dev/)
- [GitHub Repository](https://github.com/ajnart/homarr)
- [Documentation](https://homarr.dev/docs)
