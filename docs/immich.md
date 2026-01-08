# Immich

Self-hosted photo and video backup solution.

## Overview

Immich is a high-performance self-hosted photo and video backup solution. It provides a Google Photos-like experience with features like machine learning-powered search, facial recognition, and mobile app syncing.

## Service Details

| Component | Image | Container |
|-----------|-------|-----------|
| **Server** | `ghcr.io/immich-app/immich-server:release` | `immich_server` |
| **ML** | `ghcr.io/immich-app/immich-machine-learning:release` | `immich_machine_learning` |
| **Redis** | `redis:6.2-alpine` | `immich_redis` |
| **Database** | `tensorchord/pgvecto-rs:pg14-v0.2.0` | `immich_postgres` |

## Environment Variables

Create `.env` file with:

| Variable | Description |
|----------|-------------|
| `UPLOAD_LOCATION` | Path for photo storage |
| `DB_PASSWORD` | PostgreSQL password |
| `DB_USERNAME` | PostgreSQL username |
| `DB_DATABASE_NAME` | Database name |
| `DB_DATA_LOCATION` | Database storage path |
| `IMMICH_VERSION` | Version tag (default: `release`) |
| `PRIVATE_DOMAIN` | Private access domain |
| `PUBLIC_DOMAIN` | Public access domain |

## Volumes

| Volume | Purpose |
|--------|---------|
| `${UPLOAD_LOCATION}:/usr/src/app/upload` | Photo/video storage |
| `${DB_DATA_LOCATION}:/var/lib/postgresql/data` | Database |
| `model-cache:/cache` | ML model cache |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.immich-server.rule=Host(`${PRIVATE_DOMAIN}`) || Host(`${PUBLIC_DOMAIN}`)
  - traefik.http.services.immich-server.loadbalancer.server.port=2283
```

## Features

- Automatic backup from mobile apps
- Machine learning search
- Facial recognition
- Object detection
- Timeline view
- Album sharing
- External library support
- Duplicate detection

## Hardware Acceleration

Uncomment in compose file for transcoding acceleration:
```yaml
extends:
  file: hwaccel.transcoding.yml
  service: nvenc  # or quicksync, vaapi
```

## Mobile Apps

- iOS: App Store
- Android: Play Store / F-Droid

Configure server URL in app settings.

## Quick Start

1. Create `.env` file with all required variables
2. Start the service: `hsds setup`
3. Access web UI via configured domain
4. Create admin account
5. Install mobile app and configure server

## Backup Recommendations

- Backup the PostgreSQL database regularly
- Store database backups separately from photos
- Use external storage for large libraries

## Resource Requirements

| Component | RAM | Notes |
|-----------|-----|-------|
| Server | 2GB+ | Depends on library size |
| ML | 4GB+ | For facial recognition |
| Database | 1GB+ | Grows with library |

## Links

- [Official Website](https://immich.app/)
- [GitHub Repository](https://github.com/immich-app/immich)
- [Documentation](https://immich.app/docs)
