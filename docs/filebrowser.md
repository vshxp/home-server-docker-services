# File Browser

Web-based file management interface.

## Overview

File Browser is a web-based file manager that provides a clean interface for browsing, uploading, downloading, and managing files on your server. It supports user management, sharing, and can be used as a simple HTTP file server.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `filebrowser/filebrowser` |
| **Container Name** | `filebrowser` |
| **Internal Port** | `80` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PUID` | User ID for file permissions | `1000` |
| `PGID` | Group ID for file permissions | `1000` |
| `PRIVATE_DOMAIN` | Private access domain | Required |
| `PUBLIC_DOMAIN` | Public access domain | Required |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/Public` | `/srv` | Files to serve |
| `/Storage/.Docker/filebrowser/db` | `/database` | SQLite database |
| `/Storage/.Docker/filebrowser/config` | `/config` | Configuration |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.filebrowser.rule=Host(`${PRIVATE_DOMAIN}`) || Host(`${PUBLIC_DOMAIN}`)
  - traefik.http.services.filebrowser.loadbalancer.server.port=80
```

## Default Credentials

- **Username**: `admin`
- **Password**: `admin`

Change these immediately after first login.

## Features

- File upload/download
- User management
- Share links with expiration
- File preview (images, videos, code)
- Command execution (configurable)
- Multiple authentication methods
- Custom branding

## Configuration

Create `filebrowser.json` for custom settings:
```json
{
  "port": 80,
  "baseURL": "",
  "address": "",
  "log": "stdout",
  "database": "/database/filebrowser.db",
  "root": "/srv"
}
```

## Quick Start

1. Create `.env` file with domain variables
2. Start the service: `hsds setup`
3. Access via Traefik domain
4. Login and change default password
5. Configure users and permissions

## Use Cases

- Simple file sharing
- Personal cloud storage interface
- Allow users to upload files
- Browse server files remotely

## Links

- [Official Website](https://filebrowser.org/)
- [GitHub Repository](https://github.com/filebrowser/filebrowser)
- [Documentation](https://filebrowser.org/features)
