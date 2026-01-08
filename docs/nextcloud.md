# Nextcloud

Self-hosted productivity platform.

## Overview

Nextcloud is a self-hosted productivity platform that provides file sync, sharing, and collaboration features similar to Google Drive/Dropbox. It supports plugins for calendar, contacts, mail, and much more.

## Service Details

| Component | Image | Container |
|-----------|-------|-----------|
| **App** | `nextcloud:apache` | `nextcloud-app` |
| **Database** | `postgres:16-alpine` | `nextcloud-db` |
| **Cache** | `redis:alpine` | `nextcloud-redis` |
| **Cron** | `nextcloud:apache` | `nextcloud-cron` |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `POSTGRES_PASSWORD` | Database password |
| `POSTGRES_DB` | Database name |
| `POSTGRES_USER` | Database user |
| `NEXTCLOUD_TRUSTED_DOMAINS` | Allowed domains |
| `PRIVATE_DOMAIN` | Private access domain |
| `PUBLIC_DOMAIN` | Public access domain |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/nextcloud/data` | `/var/www/html` | Application data |
| `nextcloud_db` | `/var/lib/postgresql/data` | Database storage |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.nextcloud_app.rule=Host(`${PRIVATE_DOMAIN}`) || Host(`${PUBLIC_DOMAIN}`)
  - traefik.http.services.nextcloud_app.loadbalancer.server.port=80
```

## Features

- File sync and sharing
- Calendar and contacts
- Collaborative document editing
- Talk (video calls)
- Mail integration
- App store with 200+ apps
- Mobile apps

## Architecture

```
nextcloud-app ←→ nextcloud-db (PostgreSQL)
      ↓
nextcloud-redis (Session cache)
      ↓
nextcloud-cron (Background jobs)
```

## Apps to Consider

| App | Purpose |
|-----|---------|
| Calendar | Event management |
| Contacts | Address book |
| Talk | Video conferencing |
| Office | Document editing |
| Notes | Note taking |

## Quick Start

1. Create `.env` file with all variables
2. Start the service: `hsds setup`
3. Access via configured domain
4. Create admin account
5. Install additional apps

## Cron Jobs

The `nextcloud-cron` container handles background tasks:
- File scanning
- Notifications
- Activity cleanup
- App updates

## Performance Tuning

Redis is configured for:
- Session storage
- File locking
- Transactional file caching

## Security

- Configure trusted domains
- Enable 2FA
- Use HTTPS
- Regular updates

## Mobile Apps

- Nextcloud Files (iOS/Android)
- Nextcloud Talk
- Nextcloud Notes

## Links

- [Official Website](https://nextcloud.com/)
- [Documentation](https://docs.nextcloud.com/)
- [App Store](https://apps.nextcloud.com/)
