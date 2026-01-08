# Kopia

Fast and secure backup tool.

## Overview

Kopia is a fast and secure open-source backup/restore tool that supports encryption, deduplication, and compression. It provides both a CLI and web interface for managing backups to various storage backends.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `kopia/kopia:latest` |
| **Container Name** | `Kopia-app` |
| **Hostname** | `Kopia` |
| **Web UI Port** | `51515` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `KOPIA_PASSWORD` | Repository encryption password |
| `KOPIA_USER` | Kopia user |
| `SERVER_USERNAME` | Web UI username |
| `SERVER_PASSWORD` | Web UI password |
| `PRIVATE_DOMAIN` | Domain for Traefik |

## Command

```yaml
command:
  - server
  - start
  - --disable-csrf-token-checks
  - --insecure
  - --address=0.0.0.0:51515
  - --server-username=${SERVER_USERNAME}
  - --server-password=${SERVER_PASSWORD}
```

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/kopia/config/dir` | `/app/config` | Configuration |
| `/Storage/.Docker/kopia/cache/dir` | `/app/cache` | Cache storage |
| `/Storage/.Docker/kopia/logs/dir` | `/app/logs` | Log files |
| `/Storage/Backups/Cloud` | `/data:ro` | Source data (read-only) |

## Features

- End-to-end encryption
- Deduplication
- Compression
- Incremental backups
- Multiple storage backends
- Snapshot policies
- Web-based UI

## Supported Backends

- Local filesystem
- SFTP
- S3 (and compatible)
- Google Cloud Storage
- Azure Blob Storage
- Backblaze B2
- Rclone

## Repository Commands

Initialize repository:
```bash
docker exec -it Kopia-app kopia repository create filesystem --path=/repository
```

Connect to existing:
```bash
docker exec -it Kopia-app kopia repository connect filesystem --path=/repository
```

## Snapshot Management

Create snapshot:
```bash
kopia snapshot create /data
```

List snapshots:
```bash
kopia snapshot list
```

## Quick Start

1. Create `.env` file with credentials
2. Start the service: `hsds setup`
3. Access web UI at `http://<host>:51515`
4. Create or connect repository
5. Configure snapshot policies

## Policies

Set retention policy:
```bash
kopia policy set --global \
  --keep-latest 10 \
  --keep-hourly 24 \
  --keep-daily 7 \
  --keep-weekly 4 \
  --keep-monthly 12
```

## Links

- [Official Website](https://kopia.io/)
- [Documentation](https://kopia.io/docs/)
- [GitHub Repository](https://github.com/kopia/kopia)
