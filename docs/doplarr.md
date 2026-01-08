# Doplarr

Discord bot for requesting media from Sonarr and Radarr.

## Overview

Doplarr is a Discord bot that allows users to request movies and TV shows directly through Discord. It integrates with Sonarr and Radarr (and optionally Overseerr) to manage media requests.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/doplarr:latest` |
| **Container Name** | `doplarr` |
| **Memory Limit** | `256M` |
| **Network** | `media` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

### Required

| Variable | Description |
|----------|-------------|
| `DISCORD__TOKEN` | Discord bot token |
| `RADARR__API` | Radarr API key |
| `RADARR__URL` | Radarr URL (e.g., `http://radarr:7878`) |
| `SONARR__API` | Sonarr API key |
| `SONARR__URL` | Sonarr URL (e.g., `http://sonarr:8989`) |
| `DOMAIN_URL` | Base domain for service URLs |

### Optional

| Variable | Description | Default |
|----------|-------------|---------|
| `DISCORD__MAX_RESULTS` | Max search results displayed | `25` |
| `OVERSEERR__API` | Overseerr API key | - |
| `OVERSEERR__URL` | Overseerr URL | - |
| `SONARR__QUALITY_PROFILE` | Default quality profile | - |
| `RADARR__QUALITY_PROFILE` | Default quality profile | - |
| `PARTIAL_SEASONS` | Allow partial season requests | `false` |

## Discord Bot Setup

1. Go to [Discord Developer Portal](https://discord.com/developers/applications)
2. Create a new application
3. Navigate to **Bot** section
4. Create a bot and copy the token
5. Enable required intents:
   - Message Content Intent
   - Server Members Intent
6. Invite bot to your server with appropriate permissions

## Quick Start

1. Create `.env` file with required variables
2. Start the service: `hsds setup`
3. Use `/request` command in Discord to search for media
4. Bot will display results and allow selection

## Commands

| Command | Description |
|---------|-------------|
| `/request movie <title>` | Request a movie |
| `/request tv <title>` | Request a TV show |

## Integration

Works with:
- **Sonarr** - TV show management
- **Radarr** - Movie management
- **Overseerr** (optional) - Request management

## Links

- [GitHub Repository](https://github.com/kiranshila/Doplarr)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-doplarr)
