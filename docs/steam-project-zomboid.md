# Steam Project Zomboid Server

Project Zomboid dedicated server.

## Overview

This service runs a Project Zomboid dedicated server using LinuxGSM. Host your own zombie survival server for co-op play with friends.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `gameservermanagers/gameserver:pz` |
| **Container Name** | `zomboid` |
| **Network** | `steam` (external) |
| **Restart Policy** | `unless-stopped` |

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `16261` | TCP/UDP | Game traffic |
| `16262` | TCP/UDP | Direct connect |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `~/Storage/Docker/steam/zomboid` | `/data` | Server data |

## User Configuration

```yaml
user: $UID:$GID
```

## Quick Start

1. Create the steam network if needed:
   ```bash
   docker network create steam
   ```
2. Start the service: `hsds setup`
3. Wait for initial download
4. Configure server settings
5. Connect via Project Zomboid client

## LinuxGSM Commands

```bash
docker exec -it zomboid ./pzserver console
docker exec -it zomboid ./pzserver start
docker exec -it zomboid ./pzserver stop
docker exec -it zomboid ./pzserver update
```

## Server Configuration

Edit server options:
- `Zomboid/Server/servertest.ini`

Common settings:
```ini
PublicName=My Zomboid Server
PublicDescription=A survival adventure
Password=serverpassword
MaxPlayers=16
PVP=false
```

## World Settings

Configure sandbox options:
- Zombie population
- Loot rarity
- Day/night cycle
- Starting conditions

## Connecting

1. Open Project Zomboid
2. Join Server
3. Enter server IP: `<your-ip>`
4. Port: `16261`
5. Enter password if set

## Resource Requirements

| Resource | Minimum | Recommended |
|----------|---------|-------------|
| RAM | 4GB | 8GB |
| CPU | 2 cores | 4 cores |
| Storage | 10GB | 20GB |

## Mods

Install mods by:
1. Find mod IDs on Steam Workshop
2. Add to server config
3. Restart server

## Links

- [LinuxGSM Project Zomboid](https://linuxgsm.com/servers/pzserver/)
- [Project Zomboid Wiki](https://pzwiki.net/wiki/Dedicated_Server)
