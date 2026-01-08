# DuckDNS

Free dynamic DNS service client.

## Overview

DuckDNS is a free dynamic DNS service that allows you to point a subdomain (yourname.duckdns.org) at your home IP address. This container automatically updates your DuckDNS record when your IP changes.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `lscr.io/linuxserver/duckdns:latest` |
| **Container Name** | `duckdns` |
| **Network Mode** | `host` |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID for file permissions | `1000` |
| `PGID` | Group ID for file permissions | `1000` |
| `TZ` | Timezone | From `${TIME_ZONE}` |
| `SUBDOMAINS` | DuckDNS subdomains (comma-separated) | Required |
| `TOKEN` | DuckDNS token | Required |
| `UPDATE_IP` | IP version to update | `ipv4` |
| `LOG_FILE` | Enable logging | `false` |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/duckdns/config` | `/config` | Configuration and logs |

## Setup Steps

1. Create account at [DuckDNS](https://www.duckdns.org/)
2. Create your desired subdomain(s)
3. Copy your token from the DuckDNS dashboard
4. Configure environment variables

## Configuration Example

```bash
# .env file
TIME_ZONE=America/Sao_Paulo
SUBDOMAINS=myserver,myserver2
TOKEN=your-duckdns-token-here
```

## Features

- Automatic IP detection
- IPv4 and IPv6 support
- Multiple subdomain support
- Low resource usage
- 5-minute update interval

## Use Cases

- Access your home server remotely
- Point domain to dynamic home IP
- Enable SSL certificates with domain
- Pair with reverse proxy for HTTPS

## Verification

Check if update is working:
```bash
docker logs duckdns
```

## Links

- [DuckDNS Website](https://www.duckdns.org/)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-duckdns)
