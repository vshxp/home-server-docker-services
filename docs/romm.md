# RomM

ROM manager and game library.

## Overview

RomM is a game library manager focused on ROM management. It provides a beautiful interface for organizing and managing your ROM collection with metadata from various gaming databases.

## Service Details

| Component | Image | Container |
|-----------|-------|-----------|
| **App** | `rommapp/romm:latest` | `romm-app` |
| **Database** | `mariadb:latest` | `romm-db` |

## Environment Variables

### Application

| Variable | Description |
|----------|-------------|
| `DB_HOST` | Database hostname |
| `DB_NAME` | Database name |
| `DB_USER` | Database user |
| `DB_PASSWD` | Database password |
| `ROMM_AUTH_SECRET_KEY` | Authentication secret |
| `IGDB_CLIENT_ID` | IGDB API client ID |
| `IGDB_CLIENT_SECRET` | IGDB API secret |
| `MOBYGAMES_API_KEY` | MobyGames API key |
| `STEAMGRIDDB_API_KEY` | SteamGridDB API key |

### Database

| Variable | Description |
|----------|-------------|
| `MYSQL_ROOT_PASSWORD` | Root password |
| `MYSQL_DATABASE` | Database name |
| `MYSQL_USER` | Database user |
| `MYSQL_PASSWORD` | Database password |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/romm/resources` | `/romm/resources` | Resources |
| `/Storage/.Docker/romm/assets` | `/romm/assets` | Game assets |
| `/Storage/.Docker/romm/config` | `/romm/config` | Configuration |
| `/Storage/Games/rom` | `/romm/library` | ROM library |
| `romm_redis_data` | `/redis-data` | Redis data |
| `mysql_data` | `/var/lib/mysql` | Database |

## Features

- Beautiful game library interface
- Metadata from IGDB, MobyGames
- Cover art from SteamGridDB
- Platform organization
- ROM file management
- Multi-file game support
- Search and filtering

## Supported Platforms

- Nintendo (NES, SNES, N64, GameCube, Wii)
- Sega (Genesis, Saturn, Dreamcast)
- Sony (PlayStation 1/2/3, PSP)
- Microsoft (Xbox)
- Handhelds (GBA, DS, 3DS)
- And many more

## API Keys

### IGDB (Required for metadata)
1. Go to [Twitch Developer Portal](https://dev.twitch.tv/console)
2. Create application
3. Get Client ID and Secret

### SteamGridDB (Recommended)
1. Go to [SteamGridDB](https://www.steamgriddb.com/)
2. Create account
3. Get API key from settings

## Quick Start

1. Create `.env` file with all credentials
2. Start the service: `hsds setup`
3. Access web interface
4. Scan ROM library
5. Metadata will be fetched automatically

## Library Structure

Organize ROMs by platform:
```
/romm/library/
├── nes/
├── snes/
├── n64/
├── ps1/
└── ...
```

## Links

- [GitHub Repository](https://github.com/rommapp/romm)
- [Documentation](https://github.com/rommapp/romm#readme)
