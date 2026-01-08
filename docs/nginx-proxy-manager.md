# Nginx Proxy Manager

Easy reverse proxy management with SSL.

## Overview

Nginx Proxy Manager provides a simple web interface for managing Nginx reverse proxy hosts with free SSL certificates. It's perfect for exposing your services with HTTPS without manual Nginx configuration.

## Service Details

| Component | Image | Container |
|-----------|-------|-----------|
| **App** | `jc21/nginx-proxy-manager:latest` | `proxy-manager` |
| **Database** | `jc21/mariadb-aria:latest` | `proxy-manager-db` |

## Ports

| Port | Purpose |
|------|---------|
| `80` | HTTP traffic |
| `443` | HTTPS traffic |
| `81` | Admin web interface |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `MYSQL_USER` | Database user |
| `MYSQL_PASSWORD` | Database password |
| `MYSQL_DATABASE` | Database name |
| `MYSQL_ROOT_PASSWORD` | Root password |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/nginx-proxy-manager/app/data` | `/data` | Configuration |
| `/Storage/.Docker/nginx-proxy-manager/app/letsencrypt` | `/etc/letsencrypt` | SSL certificates |
| `/Storage/.Docker/nginx-proxy-manager/database` | `/var/lib/mysql` | Database |

## Default Credentials

- **Email**: `admin@example.com`
- **Password**: `changeme`

Change these immediately after first login.

## Features

- Easy proxy host management
- Free Let's Encrypt SSL
- Access lists
- Redirection rules
- 404 host support
- Custom Nginx config
- Stream (TCP/UDP) proxying

## Setup Types

### Proxy Host
Forward traffic to internal services:
- Domain → Internal IP:Port
- Automatic SSL

### Redirection Host
Redirect domains:
- old.example.com → new.example.com

### Stream
TCP/UDP proxying:
- Database access
- Game servers

## Quick Start

1. Create `.env` file with database credentials
2. Start the service: `hsds setup`
3. Access admin at `http://<host>:81`
4. Login with default credentials
5. Change password immediately
6. Add proxy hosts

## Adding a Proxy Host

1. Click **Proxy Hosts** → **Add**
2. Enter domain name
3. Set forward hostname/IP and port
4. Enable SSL (Let's Encrypt)
5. Save

## SSL Certificates

- Automatic Let's Encrypt provisioning
- DNS challenge support
- Custom certificates supported
- Auto-renewal

## Access Lists

Create access control:
- IP whitelist/blacklist
- Basic authentication
- Satisfy any/all

## Links

- [Official Website](https://nginxproxymanager.com/)
- [GitHub Repository](https://github.com/NginxProxyManager/nginx-proxy-manager)
- [Documentation](https://nginxproxymanager.com/guide/)
