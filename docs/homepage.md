# Homepage

Modern, fully static, fast, and secure application dashboard.

## Overview

Homepage is a highly customizable application dashboard with integrations for over 100 services. It's designed to be fast, static, and provides real-time information from your self-hosted services through widgets.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `ghcr.io/gethomepage/homepage:latest` |
| **Container Name** | `homepage` |
| **Internal Port** | `3000` |
| **Memory Limit** | `512M` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `CUSTOM_DNS_PROVIDER` | Custom DNS server | Required |
| `DOMAIN_NAME` | Domain for Traefik | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/homepage/config` | `/app/config` | Configuration files |
| `/var/run/docker.sock` | `/var/run/docker.sock` | Docker integration |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.homepage.rule=Host(`${DOMAIN_NAME}`)
  - traefik.http.services.homepage.loadbalancer.server.port=3000
```

## Configuration Files

Configuration is done via YAML files in the config directory:

### services.yaml
```yaml
- Group Name:
    - Service:
        icon: si-docker
        href: http://service.local
        description: Service description
        widget:
          type: servicetype
          url: http://service.local
          key: api_key
```

### widgets.yaml
```yaml
- resources:
    cpu: true
    memory: true
    disk: /
```

### settings.yaml
```yaml
title: My Dashboard
theme: dark
color: slate
```

## Features

- 100+ service integrations
- Docker integration
- Kubernetes support
- Custom CSS/JavaScript
- Search functionality
- Bookmarks
- Multiple languages

## Supported Widgets

- Media (*arr stack, Plex, Emby)
- Download clients
- System resources
- Weather
- Calendar
- And many more

## Quick Start

1. Create `.env` file with required variables
2. Start the service: `hsds setup`
3. Access via configured domain
4. Edit YAML files in config directory
5. Dashboard updates automatically

## Links

- [Official Website](https://gethomepage.dev/)
- [GitHub Repository](https://github.com/gethomepage/homepage)
- [Widget Documentation](https://gethomepage.dev/widgets/)
