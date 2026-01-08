# Traefik

Modern reverse proxy and load balancer.

## Overview

Traefik is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy. It integrates with Docker to automatically discover services and route traffic based on labels.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `traefik:v3.2` |
| **Container Name** | `traefik` |
| **HTTP Port** | `80` |
| **HTTPS Port** | `443` |
| **Dashboard Port** | `8080` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `CUSTOM_DNS_PROVIDER` | DNS resolver |
| `PRIVATE_DOMAIN` | Dashboard domain |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/var/run/docker.sock` | `/var/run/docker.sock` | Docker discovery |
| `./config/traefik.yaml` | `/etc/traefik/traefik.yaml:ro` | Configuration |

## Traefik Self-Routing

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.traefik.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.traefik.loadbalancer.server.port=8080
```

## Features

- Automatic service discovery
- Docker provider integration
- Let's Encrypt automatic SSL
- Load balancing
- Middlewares (auth, rate limiting)
- Dashboard and API
- Metrics and tracing

## Configuration File

Create `config/traefik.yaml`:

```yaml
api:
  dashboard: true
  insecure: true

entryPoints:
  web:
    address: ":80"
  websecure:
    address: ":443"

providers:
  docker:
    endpoint: "unix:///var/run/docker.sock"
    exposedByDefault: false
    network: services

log:
  level: INFO
```

## Service Labels

Add to services for routing:

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.myservice.rule=Host(`service.example.com`)
  - traefik.http.services.myservice.loadbalancer.server.port=8080
```

## SSL/HTTPS

### Let's Encrypt
```yaml
certificatesResolvers:
  letsencrypt:
    acme:
      email: admin@example.com
      storage: /letsencrypt/acme.json
      httpChallenge:
        entryPoint: web
```

### Using with Service
```yaml
labels:
  - traefik.http.routers.myservice.tls=true
  - traefik.http.routers.myservice.tls.certresolver=letsencrypt
```

## Middlewares

### Basic Auth
```yaml
labels:
  - traefik.http.middlewares.auth.basicauth.users=user:$$apr1$$...
  - traefik.http.routers.service.middlewares=auth
```

### Redirect HTTP to HTTPS
```yaml
labels:
  - traefik.http.middlewares.redirect.redirectscheme.scheme=https
```

## Quick Start

1. Create `config/traefik.yaml` configuration
2. Create `.env` with domain variable
3. Start the service: `hsds setup`
4. Access dashboard via configured domain
5. Add labels to services for routing

## Dashboard

Access at `http://<domain>:8080`:
- View all routers
- Check services status
- Monitor middlewares
- View entrypoints

## Comparison with NPM

| Feature | Traefik | Nginx PM |
|---------|---------|----------|
| Config | Labels/YAML | Web UI |
| Discovery | Automatic | Manual |
| Learning | Steeper | Easier |
| Flexibility | Higher | Lower |

## Links

- [Official Website](https://traefik.io/)
- [Documentation](https://doc.traefik.io/traefik/)
- [Docker Provider](https://doc.traefik.io/traefik/providers/docker/)
