# Portainer

Docker management GUI.

## Overview

Portainer is a lightweight management UI that allows you to easily manage your Docker environments. It provides a web interface for managing containers, images, volumes, and networks.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `portainer/portainer:latest` |
| **Container Name** | `portainer` |
| **Internal Port** | `9000` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `PRIVATE_DOMAIN` | Domain for Traefik routing |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/var/run/docker.sock` | `/var/run/docker.sock` | Docker API access |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.portainer.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.portainer.loadbalancer.server.port=9000
```

## Features

- Container management
- Image management
- Volume management
- Network management
- Stack deployment (compose)
- User management
- Environment management
- App templates

## First Setup

1. Access Portainer web UI
2. Create admin user
3. Select "Local" environment
4. Start managing containers

## Container Actions

- Start/Stop/Restart
- View logs
- Execute console
- Inspect configuration
- Resource stats

## Stacks

Deploy docker-compose files:
1. Go to **Stacks**
2. Click **Add stack**
3. Paste compose file or upload
4. Deploy

## App Templates

Quick deploy common applications:
- WordPress
- Nginx
- MySQL
- And many more

## Quick Start

1. Create `.env` file with domain
2. Start the service: `hsds setup`
3. Access via configured domain
4. Create admin account
5. Connect to local Docker

## Security Notes

- Docker socket access is powerful
- Limit user access appropriately
- Use HTTPS in production
- Consider edge agent for remote hosts

## Multi-Environment

Manage multiple Docker hosts:
- Local Docker
- Remote Docker (API)
- Kubernetes clusters
- Edge agents

## Labels

Portainer label for visibility:
```yaml
labels:
  - io.portainer.accesscontrol.public
```

## Links

- [Official Website](https://www.portainer.io/)
- [Documentation](https://docs.portainer.io/)
- [GitHub Repository](https://github.com/portainer/portainer)
