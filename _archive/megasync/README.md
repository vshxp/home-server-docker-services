# MEGAcmd Docker

Docker container for [MEGAcmd](https://github.com/meganz/MEGAcmd) with automatic login and bidirectional sync.

## Quick Start

```bash
# 1. Configure credentials
cp .env.example .env
nano .env

# 2. Start container
docker compose up -d

# 3. Check status
docker compose logs -f megacmd
```

## Configuration

Create a `.env` file with your credentials:

```env
# MEGA.nz Credentials
MEGA_EMAIL=your@email.com
MEGA_PASSWORD=your_password

# Bidirectional Sync
MEGA_SYNC_LOCAL=/data
MEGA_SYNC_REMOTE=/

# Host bind mount (optional)
# Choose any host path to mount as /data in the container.
# If unset, it defaults to ./data
MEGA_DATA_PATH=./data

# UID/GID mapping (optional)
# Use these if your chosen MEGA_DATA_PATH is owned by a different user.
PUID=1000
PGID=1000
```

| Variable | Description |
|----------|-------------|
| `MEGA_EMAIL` | Your MEGA account email |
| `MEGA_PASSWORD` | Your MEGA account password |
| `MEGA_SYNC_LOCAL` | Local folder to sync (container path) |
| `MEGA_SYNC_REMOTE` | Remote MEGA folder (use `/` for root) |
| `MEGA_DATA_PATH` | Host folder mounted to `/data` (absolute path or relative to `docker-compose.yml`) |
| `PUID` | UID to run MEGAcmd as (used to access the mounted folder) |
| `PGID` | GID to run MEGAcmd as (used to access the mounted folder) |

## Bidirectional Sync

The container automatically configures bidirectional sync on startup:

- **Local → Remote**: Files added to `./data` are uploaded to MEGA
- **Remote → Local**: Files added to MEGA are downloaded to `./data`
- **Changes sync both ways** automatically

### Sync Commands

```bash
# Check sync status
docker compose exec -u megauser megacmd mega-sync

# View active transfers
docker compose exec -u megauser megacmd mega-transfers

# Pause sync
docker compose exec -u megauser megacmd mega-sync -s

# Resume sync
docker compose exec -u megauser megacmd mega-sync -r

# Remove sync (keeps files)
docker compose exec -u megauser megacmd mega-sync -d /data
```

## Common Commands

```bash
# List remote files
docker compose exec -u megauser megacmd mega-ls /

# Upload file manually
docker compose exec -u megauser megacmd mega-put /data/file.txt /folder/

# Download file manually
docker compose exec -u megauser megacmd mega-get /remote/file.txt /data/

# Check account info
docker compose exec -u megauser megacmd mega-whoami

# Logout
docker compose exec -u megauser megacmd mega-logout
```

## Volumes

| Path | Description |
|------|-------------|
| `./data` | Synced folder (bidirectional) |
| `megacmd_config` | Session data (persists login) |

## File Structure

```
megasync/
├── Dockerfile
├── docker-compose.yml
├── entrypoint.sh
├── .env              # Your credentials (git ignored)
├── .env.example      # Template
├── .gitignore
└── data/             # Synced files
```

## References

- [MEGAcmd GitHub](https://github.com/meganz/MEGAcmd)
- [MEGAcmd User Guide](https://github.com/meganz/MEGAcmd/blob/master/UserGuide.md)
