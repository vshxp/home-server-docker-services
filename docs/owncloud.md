# ownCloud

Enterprise file sync and share.

## Overview

ownCloud is an open-source file sync and share platform. It allows you to store files, sync them across devices, and share with others. It's similar to Nextcloud (which was forked from ownCloud).

## Service Details

| Component | Image | Container |
|-----------|-------|-----------|
| **App** | `owncloud/server:${VERSION}` | `owncloud-app` |
| **Database** | `mariadb:10.11` | `owncloud-db` |
| **Cache** | `redis:6` | `owncloud-redis` |

## Environment Variables

### Application

| Variable | Description |
|----------|-------------|
| `OWNCLOUD_VERSION` | ownCloud version tag |
| `OWNCLOUD_DOMAIN` | Primary domain |
| `OWNCLOUD_TRUSTED_DOMAINS` | Allowed domains |
| `ADMIN_USERNAME` | Admin username |
| `ADMIN_PASSWORD` | Admin password |

### Database

| Variable | Description |
|----------|-------------|
| `MYSQL_ROOT_PASSWORD` | MariaDB root password |
| `MYSQL_DATABASE` | Database name |
| `MYSQL_USER` | Database user |
| `MYSQL_PASSWORD` | Database password |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/owncloud/app/data` | `/mnt/data` | User files |
| `/Storage/.Docker/owncloud/database/data` | `/var/lib/mysql` | Database |
| `redis` | `/data` | Redis persistence |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.owncloud.rule=Host(`${PRIVATE_DOMAIN}`) || Host(`${PUBLIC_DOMAIN}`)
  - traefik.http.services.owncloud.loadbalancer.server.port=8080
```

## Health Checks

All services include health checks:
- **App**: Custom healthcheck script
- **Database**: mysqladmin ping
- **Redis**: redis-cli ping

## Features

- File sync and sharing
- Version control
- File comments
- Collaborative editing
- External storage support
- User and group management
- LDAP/AD integration

## ownCloud vs Nextcloud

| Feature | ownCloud | Nextcloud |
|---------|----------|-----------|
| License | Dual (open/enterprise) | AGPLv3 |
| Focus | Enterprise | Community |
| Apps | Fewer | More |
| Updates | Stable | Frequent |

## Quick Start

1. Create `.env` file with all variables
2. Start the service: `hsds setup`
3. Wait for initialization (check health)
4. Access via configured domain
5. Login with admin credentials

## Mobile Apps

- ownCloud iOS
- ownCloud Android
- Desktop sync client

## Performance

Database optimizations included:
```yaml
command: ["--max-allowed-packet=128M", "--innodb-log-file-size=64M"]
```

## Links

- [Official Website](https://owncloud.com/)
- [Documentation](https://doc.owncloud.com/)
- [Docker Documentation](https://doc.owncloud.com/server/admin_manual/installation/docker/)
