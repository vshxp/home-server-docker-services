# Steam Rust Server

Rust dedicated server.

## Overview

This service runs a Rust dedicated server with optional Oxide mod support. Host your own survival server for Rust gameplay.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `didstopia/rust-server` |
| **Container Name** | `rust-server` |
| **Restart Policy** | Default |

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| `28015` | TCP/UDP | Game traffic |
| `28016` | TCP | RCON |
| `8081` | TCP | Web RCON |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `RUST_SERVER_NAME` | Server name displayed in browser |
| `RUST_SERVER_WORLDSIZE` | Map size (1000-6000) |
| `RUST_RCON_PASSWORD` | RCON admin password |
| `RUST_OXIDE_ENABLED` | Enable Oxide mod (true/false) |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/Games/server/rust` | `/steamcmd/rust` | Server files |

## Quick Start

1. Create `.env` file:
   ```bash
   RUST_SERVER_NAME=My Rust Server
   RUST_SERVER_WORLDSIZE=3000
   RUST_RCON_PASSWORD=myrconpassword
   RUST_OXIDE_ENABLED=true
   ```
2. Start the service: `hsds setup`
3. Wait for initial download (can take 30+ minutes)
4. Connect via Rust client

## World Sizes

| Size | Description |
|------|-------------|
| 1000 | Tiny (testing) |
| 2000 | Small |
| 3000 | Medium (default) |
| 4000 | Large |
| 6000 | Huge |

## RCON Access

Connect via RCON:
- **IP**: Server IP
- **Port**: 28016
- **Password**: Your RCON password

Web RCON available at `http://<server-ip>:8081`

## Oxide Plugins

With Oxide enabled:
1. Place plugins in `oxide/plugins/`
2. Reload server or use RCON
3. Configure in `oxide/config/`

Popular plugins:
- Gather Manager
- Stack Size Controller
- Quick Smelt
- Teleportation

## Connecting

1. Open Rust
2. Press F1 for console
3. Type: `client.connect <server-ip>:28015`

Or find in server browser.

## Resource Requirements

| Resource | Minimum | Recommended |
|----------|---------|-------------|
| RAM | 8GB | 16GB |
| CPU | 4 cores | 6+ cores |
| Storage | 50GB | 100GB |

## Wipe Schedule

Rust servers typically wipe:
- Monthly (forced by updates)
- Weekly/biweekly (optional)

Configure wipe in server settings.

## Links

- [Docker Image Docs](https://github.com/Didstopia/rust-server)
- [Rust Server Wiki](https://developer.valvesoftware.com/wiki/Rust_Dedicated_Server)
- [Oxide Mod](https://umod.org/games/rust)
