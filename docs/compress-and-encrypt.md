# Compress and Encrypt

Automated backup compression and encryption.

## Overview

This is a custom service that automatically compresses and optionally encrypts backup directories on a scheduled basis. It creates secure, space-efficient backups of your important data.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `compress_encrypt` (custom build) |
| **Container Name** | `compress-and-encrypt` |
| **Network Mode** | `host` |
| **User** | `root` |

## Build Configuration

```yaml
build:
  context: .
  dockerfile: Dockerfile
```

This service builds from a local Dockerfile.

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `COMPRESS_PASSWORD` | Encryption password | Optional |
| `CRON_SCHEDULE` | Backup schedule | `0 6 * * 1` (Monday 6AM) |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/Backups/Companies` | `/input_dir/companies` | Source files |
| `/Storage/Backups/Encrypted` | `/output_dir` | Output backups |

## Features

- Scheduled compression
- Optional encryption
- Cron-based scheduling
- Multiple input directories
- Zip format output

## Cron Schedule

Default: `0 6 * * 1` (Every Monday at 6 AM)

| Field | Value | Meaning |
|-------|-------|---------|
| Minute | 0 | At minute 0 |
| Hour | 6 | At 6 AM |
| Day | * | Every day |
| Month | * | Every month |
| Weekday | 1 | Monday |

## Schedule Examples

| Schedule | Cron |
|----------|------|
| Daily at midnight | `0 0 * * *` |
| Weekly Sunday 3AM | `0 3 * * 0` |
| Monthly 1st at 2AM | `0 2 1 * *` |
| Every 6 hours | `0 */6 * * *` |

## Encryption

When `COMPRESS_PASSWORD` is set:
- Output files are encrypted with AES
- Password required to extract
- Secure storage of sensitive data

Without password:
- Standard zip compression
- No encryption applied

## Quick Start

1. Create `.env` file:
   ```bash
   COMPRESS_PASSWORD=secure_encryption_password
   CRON_SCHEDULE="0 6 * * 1"
   ```
2. Build and start: `hsds setup`
3. Backups will run on schedule
4. Encrypted zips appear in output directory

## Adding More Directories

Modify docker-compose volumes:
```yaml
volumes:
  - /path/to/source1:/input_dir/source1
  - /path/to/source2:/input_dir/source2
  - /Storage/Backups/Encrypted:/output_dir
```

## Output Format

Files are named: `<directory>_<timestamp>.zip`

Example: `companies_2024-01-15_060000.zip`

## Manual Execution

Trigger backup manually:
```bash
docker exec compress-and-encrypt /app/backup.sh
```

## Use Cases

- Weekly encrypted backups
- Offsite backup preparation
- Compliant data archiving
- Secure document storage

## Security Notes

- Store encryption password securely
- Don't commit password to version control
- Test restore procedures
- Keep multiple backup generations

## Links

- Custom service - see Dockerfile in service directory
