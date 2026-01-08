# Seafile

High-performance file sync and share.

## Overview

Seafile is an open-source, self-hosted file sync and share solution with high performance and reliability. It's known for its excellent sync performance and library-based organization.

## Service Details

| Component | Image | Container |
|-----------|-------|-----------|
| **App** | `seafileltd/seafile-mc:11.0-latest` | `seafile` |
| **Database** | `mariadb:10.11` | `seafile-mysql` |
| **Cache** | `memcached:1.6.18` | `seafile-memcached` |

## Network

Uses dedicated network: `seafile-net`

## Ports

| Port | Purpose |
|------|---------|
| `80` | HTTP |
| `443` | HTTPS (if enabled) |

## Environment Variables

### Database

| Variable | Default |
|----------|---------|
| `MYSQL_ROOT_PASSWORD` | `db_dev` |
| `MYSQL_LOG_CONSOLE` | `true` |
| `MARIADB_AUTO_UPGRADE` | `1` |

### Application

| Variable | Description | Default |
|----------|-------------|---------|
| `DB_HOST` | Database host | `db` |
| `DB_ROOT_PASSWD` | Database root password | `db_dev` |
| `TIME_ZONE` | Timezone | `Etc/UTC` |
| `SEAFILE_ADMIN_EMAIL` | Admin email | `me@example.com` |
| `SEAFILE_ADMIN_PASSWORD` | Admin password | `asecret` |
| `SEAFILE_SERVER_LETSENCRYPT` | Enable HTTPS | `false` |
| `SEAFILE_SERVER_HOSTNAME` | Server hostname | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/seafile/database` | `/var/lib/mysql` | Database |
| `/Storage/.Docker/seafile/app/shared` | `/shared` | Seafile data |
| `/Storage/.Docker/seafile/app/data` | `/opt/seafile-data/seafile` | File storage |

## Features

- Library-based organization
- Client-side encryption
- File versioning
- Delta sync (bandwidth efficient)
- Mobile apps
- WebDAV support
- Office document preview

## Seafile vs Others

| Feature | Seafile | Nextcloud |
|---------|---------|-----------|
| Sync Speed | Excellent | Good |
| Organization | Libraries | Folders |
| Storage | Deduplicated | Standard |
| Plugins | Limited | Extensive |

## Quick Start

1. Configure environment variables
2. Start the service: `hsds setup`
3. Wait for initialization
4. Access at `http://<host>`
5. Login with admin credentials

## Client Applications

- Desktop sync (Windows, macOS, Linux)
- Mobile apps (iOS, Android)
- Drive client for mapped drives
- CLI client

## Library Encryption

Create encrypted libraries:
1. Create new library
2. Enable encryption
3. Set password
4. Files encrypted client-side

## Memcached

Configured for session caching:
```yaml
entrypoint: memcached -m 256
```

## Security Notes

Change default credentials:
- Database root password
- Admin email and password
- Enable HTTPS for production

## Links

- [Official Website](https://www.seafile.com/)
- [Documentation](https://manual.seafile.com/)
- [Docker Documentation](https://manual.seafile.com/docker/deploy_seafile_with_docker/)
