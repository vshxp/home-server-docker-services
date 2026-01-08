# Docmost

Open-source collaborative wiki and documentation platform.

## Overview

Docmost is an open-source alternative to Notion and Confluence. It provides a modern, collaborative documentation platform with real-time editing, markdown support, and team collaboration features.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `docmost/docmost:latest` |
| **Container Name** | `docmost-app` |
| **Database** | PostgreSQL 16 |
| **Cache** | Redis 7.2 |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Services Architecture

This stack includes three services:

1. **docmost** - Main application
2. **db** - PostgreSQL database
3. **redis** - Redis cache

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `APP_URL` | Public URL of the application | Required |
| `APP_SECRET` | Secret key for encryption | Required |
| `POSTGRE_PASSWORD` | PostgreSQL password | Required |

## Volumes

| Volume | Purpose |
|--------|---------|
| `docmost` | Application storage |
| `db_data` | PostgreSQL data |
| `redis_data` | Redis persistence |

## Database Configuration

```yaml
DATABASE_URL: "postgresql://docmost:${POSTGRE_PASSWORD}@db:5432/docmost?schema=public"
REDIS_URL: "redis://redis:6379"
```

## Features

- Real-time collaborative editing
- Markdown support
- Workspaces and permissions
- Search functionality
- API access
- Self-hosted and private

## Quick Start

1. Create `.env` file:
   ```bash
   APP_URL=https://docs.yourdomain.com
   APP_SECRET=$(openssl rand -base64 32)
   POSTGRE_PASSWORD=secure_password_here
   ```
2. Start the service: `hsds setup`
3. Access at your configured `APP_URL`
4. Create admin account on first visit

## Backup

Backup the PostgreSQL database:
```bash
docker exec docmost-db-postgres pg_dump -U docmost docmost > backup.sql
```

## Links

- [Official Website](https://docmost.com/)
- [GitHub Repository](https://github.com/docmost/docmost)
- [Documentation](https://docmost.com/docs)
