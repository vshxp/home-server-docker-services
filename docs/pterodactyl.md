# Pterodactyl

Game server management panel.

## Overview

Pterodactyl is a free, open-source game server management panel built with PHP, React, and Go. It supports a wide variety of games including Minecraft, Rust, ARK, and more.

## Service Details

| Component | Image | Container |
|-----------|-------|-----------|
| **Panel** | `ghcr.io/pterodactyl/panel:latest` | `pterodactyl-app` |
| **Database** | `mariadb:10.5` | `pterodactyl-db` |
| **Cache** | `redis:alpine` | `pterodactyl-cache` |

## Ports

| Port | Purpose |
|------|---------|
| `80` | HTTP |
| `443` | HTTPS |

## Environment Variables

### Application

| Variable | Description |
|----------|-------------|
| `APP_URL` | Panel URL |
| `APP_TIMEZONE` | Timezone |
| `APP_SERVICE_AUTHOR` | Service author email |

### Database

| Variable | Description |
|----------|-------------|
| `MYSQL_PASSWORD` | Database password |
| `MYSQL_ROOT_PASSWORD` | Root password |
| `MYSQL_DATABASE` | Database name |
| `MYSQL_USER` | Database user |

### Mail

| Variable | Description |
|----------|-------------|
| `MAIL_FROM` | From email address |
| `MAIL_DRIVER` | Mail driver (smtp) |
| `MAIL_HOST` | SMTP host |
| `MAIL_PORT` | SMTP port |
| `MAIL_USERNAME` | SMTP username |
| `MAIL_PASSWORD` | SMTP password |
| `MAIL_ENCRYPTION` | TLS/SSL |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/pterodactyl/var/` | `/app/var/` | Panel data |
| `/Storage/.Docker/pterodactyl/nginx/` | `/etc/nginx/http.d/` | Nginx config |
| `/Storage/.Docker/pterodactyl/certs/` | `/etc/letsencrypt/` | SSL certs |
| `/Storage/.Docker/pterodactyl/logs/` | `/app/storage/logs` | Log files |
| `/Storage/.Docker/pterodactyl/database` | `/var/lib/mysql` | Database |

## Architecture

```
Panel (Web UI) ←→ Database (MariaDB)
      ↓
    Redis (Cache/Sessions)
      ↓
   Wings (Daemon on game servers)
```

## Wings Daemon

The panel requires Wings daemon on servers running games:
```bash
# Install Wings on game server nodes
curl -L -o /usr/local/bin/wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
chmod u+x /usr/local/bin/wings
```

## Supported Games

- Minecraft (Java/Bedrock)
- Rust
- ARK: Survival Evolved
- Counter-Strike
- Garry's Mod
- Terraria
- And 100+ more

## Quick Start

1. Create `.env` file with all variables
2. Start the service: `hsds setup`
3. Create admin user:
   ```bash
   docker exec -it pterodactyl-app php artisan p:user:make
   ```
4. Access panel at configured URL
5. Install Wings on game server nodes
6. Create locations and nodes

## Resource Requirements

| Component | RAM | Notes |
|-----------|-----|-------|
| Panel | 512MB+ | Web interface |
| Wings | Varies | Per game server |

## Links

- [Official Website](https://pterodactyl.io/)
- [Documentation](https://pterodactyl.io/panel/1.0/getting_started.html)
- [GitHub Repository](https://github.com/pterodactyl/panel)
