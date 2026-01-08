# Uptime Kuma

Self-hosted monitoring tool.

## Overview

Uptime Kuma is a self-hosted monitoring tool like Uptime Robot. It monitors your services and notifies you when they go down. It features a beautiful UI, multiple notification channels, and various monitoring types.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `louislam/uptime-kuma:latest` |
| **Container Name** | `uptime-kuma` |
| **Internal Port** | `3001` |
| **Memory Limit** | `256M` |
| **Network** | `services` (external) |
| **Restart Policy** | `always` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `PRIVATE_DOMAIN` | Domain for Traefik | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/uptime-kuma/data` | `/app/data` | SQLite database |
| `/var/run/docker.sock` | `/var/run/docker.sock:ro` | Docker monitoring |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.uptime-kuma.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.uptime-kuma.loadbalancer.server.port=3001
```

## Monitoring Types

| Type | Description |
|------|-------------|
| HTTP(s) | Web endpoint monitoring |
| TCP Port | Port availability |
| Ping | ICMP ping |
| DNS | DNS resolution |
| Docker Container | Container health |
| Push | Heartbeat monitoring |
| Steam Game Server | Game server status |
| MQTT | MQTT broker |

## Features

- Beautiful responsive UI
- 90+ notification services
- Status pages
- Multi-language support
- Multiple status pages
- 2FA authentication
- Certificate expiry monitoring

## Notification Services

- Discord
- Telegram
- Slack
- Email (SMTP)
- Pushover
- Webhook
- And 90+ more

## Quick Start

1. Create `.env` file with domain variable
2. Start the service: `hsds setup`
3. Access via configured domain
4. Create admin account
5. Add monitors

## Docker Monitoring

With Docker socket mounted, you can:
- Monitor container status
- Check container health
- Track restart counts

## Status Pages

Create public status pages showing:
- Service availability
- Uptime percentage
- Incident history

## API Access

Uptime Kuma provides an API:
```bash
curl -H "Authorization: Bearer <token>" \
  http://kuma.local/api/monitor
```

## Links

- [Official Website](https://uptime.kuma.pet/)
- [GitHub Repository](https://github.com/louislam/uptime-kuma)
- [Demo](https://demo.uptime.kuma.pet/)
