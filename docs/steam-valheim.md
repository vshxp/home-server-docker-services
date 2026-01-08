# Steam Valheim Server

Valheim dedicated server.

## Overview

This service runs a Valheim dedicated server using LinuxGSM. Host your own Viking survival adventure for co-op play with friends.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `gameservermanagers/gameserver:vh` |
| **Container Name** | `vhserver` |
| **Network** | `steam` (external) |
| **Restart Policy** | `unless-stopped` |

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `2456` | TCP/UDP | Game traffic |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `~/Storage/Docker/steam/valheim` | `/data` | Server data |

## Quick Start

1. Create the steam network if needed:
   ```bash
   docker network create steam
   ```
2. Start the service: `hsds setup`
3. Wait for initial download
4. Configure server settings
5. Connect via Valheim client

## LinuxGSM Commands

```bash
docker exec -it vhserver ./vhserver console
docker exec -it vhserver ./vhserver start
docker exec -it vhserver ./vhserver stop
docker exec -it vhserver ./vhserver update
```

## Server Configuration

Edit configuration in data directory:
- Server name
- World name
- Password
- Public visibility

## Connecting

1. Open Valheim
2. Start Game → Join Game
3. Add Server: `<your-ip>:2456`
4. Enter password

Or use Steam server browser.

## World Management

Worlds are stored in the data directory. Backup regularly:
```bash
cp -r ~/Storage/Docker/steam/valheim/worlds ~/valheim-backup
```

## Resource Requirements

| Resource | Minimum | Recommended |
|----------|---------|-------------|
| RAM | 4GB | 8GB |
| CPU | 2 cores | 4 cores |
| Storage | 5GB | 10GB |

## Crossplay

Valheim supports crossplay between:
- Steam
- Xbox
- Microsoft Store

Ensure crossplay is enabled in server config.

## Performance Tips

- Smaller worlds = better performance
- Limit concurrent players
- Regular server restarts
- Keep game updated

## Links

- [LinuxGSM Valheim](https://linuxgsm.com/servers/vhserver/)
- [Valheim Wiki](https://valheim.fandom.com/wiki/Dedicated_servers)
