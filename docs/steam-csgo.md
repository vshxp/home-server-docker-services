# Steam CS:GO Server

Counter-Strike: Global Offensive dedicated server.

## Overview

This service runs a Counter-Strike: Global Offensive (CS:GO) dedicated server using LinuxGSM (Linux Game Server Managers). It allows you to host your own CS:GO server for private matches or community play.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `gameservermanagers/gameserver:csgo` |
| **Container Name** | `csgo-server` |
| **Network** | `steam` (external) |
| **Restart Policy** | `unless-stopped` |

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `27015` | TCP/UDP | Game traffic |
| `27020` | UDP | SourceTV |
| `27005` | UDP | Client port |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `~/Storage/Docker/steam/csgo` | `/data` | Server data |

## User Configuration

```yaml
user: $UID:$GID
```

Set `UID` and `GID` environment variables for proper file permissions.

## Quick Start

1. Create the steam network if needed:
   ```bash
   docker network create steam
   ```
2. Start the service: `hsds setup`
3. Wait for initial download (can take 15-30 minutes)
4. Connect via CS:GO client

## LinuxGSM Commands

Access server console:
```bash
docker exec -it csgo-server ./csgoserver console
```

Common commands:
```bash
./csgoserver start
./csgoserver stop
./csgoserver restart
./csgoserver update
./csgoserver validate
```

## Server Configuration

Edit config files in the data directory:
- `serverfiles/csgo/cfg/server.cfg`

Common settings:
```cfg
hostname "My CS:GO Server"
sv_password "serverpassword"
rcon_password "rconpassword"
```

## Game Modes

| Mode | Command |
|------|---------|
| Competitive | `game_type 0; game_mode 1` |
| Casual | `game_type 0; game_mode 0` |
| Deathmatch | `game_type 1; game_mode 2` |
| Arms Race | `game_type 1; game_mode 0` |

## Connecting

1. Open CS:GO
2. Open console (~)
3. Type: `connect <server-ip>:27015`

## Resource Requirements

| Resource | Minimum | Recommended |
|----------|---------|-------------|
| RAM | 2GB | 4GB |
| CPU | 2 cores | 4 cores |
| Storage | 30GB | 50GB |

## Links

- [LinuxGSM CS:GO](https://linuxgsm.com/servers/csgoserver/)
- [Valve Developer Wiki](https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers)
