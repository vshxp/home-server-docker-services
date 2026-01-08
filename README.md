# Home Server Docker Services

The definitive services for your home server.

![](banner.png)

## TL;DR

```bash
chmod +x install.sh
./install.sh hsds-cli
hsds setup quiet
```

## Requirements

Any Debian based Linux distribution.

## How to Install

Just run the install command. It will install Docker and all dependencies to run the services.

```bash
chmod +x install.sh
./install.sh hsds-cli
```

## Usage

Inside the `_archive` folder are the services. Just move the folder of the services that you want to run 1 level up.

```
.
├── README.md
├── install.sh
└── _archive
    ├── bazarr
    │   ├── docker-compose.yml
    │   └── readme.md
    └── twingate
        └── docker-compose.yml
```

In this example, twingate will be installed:

```
.
├── README.md
├── install.sh
├── _archive
│   └── bazarr
│       ├── docker-compose.yml
│       └── readme.md
└── twingate
    ├── docker-compose.yml
    └── readme.md
```

---

## CLI Commands

```
hsds   shx@dev  2025-03-02
---------------------------
Home Server Docker Services
hsds-cli v4.0.0
---------------------------

Usage: hsds {destroy | stop | pull | setup | clean | update | parallel | help}
Example: hsds setup

Options:
 - destroy: Destroy the Docker images ( docker compose down )
 - stop: Stop the Docker images ( docker compose stop )
 - pull: Pull the Docker images ( docker compose pull )
 - setup: Setup the Docker images ( docker compose up -d )
 - list: List the Docker images ( docker ps )
 - clean: Clean the system
 - update: Update hsds-cli
 - pull-parallel: Pull Docker images in parallel
 - help: Display help
 - uninstall: uninstall hsds-cli

Optional parameters:
 - quiet: Install requirements and containers without confirmation
Example: hsds setup quiet
```

---

## Services Available

### Media Streaming

| Service | Description | Docs |
|---------|-------------|------|
| [Emby](https://emby.media/) | Media server for streaming videos, music, and photos | [docs/emby.md](docs/emby.md) |
| [Jellyfin](https://jellyfin.org/) | Free software media system (open-source Emby alternative) | [docs/jellyfin.md](docs/jellyfin.md) |
| [Jellyseerr](https://github.com/Fallenbagel/jellyseerr) | Request management for Jellyfin/Emby | [docs/jellyseerr.md](docs/jellyseerr.md) |

### Media Management (*arr Stack)

| Service | Description | Docs |
|---------|-------------|------|
| [Bazarr](https://www.bazarr.media/) | Subtitle management for Sonarr and Radarr | [docs/bazarr.md](docs/bazarr.md) |
| [Lidarr](https://lidarr.audio/) | Music collection manager | [docs/lidarr.md](docs/lidarr.md) |
| [Prowlarr](https://prowlarr.com/) | Indexer manager for *arr applications | [docs/prowlarr.md](docs/prowlarr.md) |
| [Radarr](https://radarr.video/) | Movie collection manager | [docs/radarr.md](docs/radarr.md) |
| [Sonarr](https://sonarr.tv/) | TV show collection manager | [docs/sonarr.md](docs/sonarr.md) |
| [Doplarr](https://github.com/kiranshila/Doplarr) | Discord bot for media requests | [docs/doplarr.md](docs/doplarr.md) |

### Download Clients

| Service | Description | Docs |
|---------|-------------|------|
| [Deluge](https://deluge-torrent.org/) | Lightweight BitTorrent client | [docs/deluge.md](docs/deluge.md) |
| [qBittorrent](https://www.qbittorrent.org/) | Free and open-source BitTorrent client | [docs/qbittorrent.md](docs/qbittorrent.md) |
| [Transmission](https://transmissionbt.com/) | Lightweight torrent client | [docs/transmission.md](docs/transmission.md) |
| [JDownloader2](https://jdownloader.org/) | Multi-hoster download manager | [docs/jdownloader2.md](docs/jdownloader2.md) |
| [MeTube](https://github.com/alexta69/metube) | YouTube downloader web interface | [docs/metube.md](docs/metube.md) |
| [TubeSync](https://github.com/meeb/tubesync) | YouTube channel/playlist synchronization | [docs/tubesync.md](docs/tubesync.md) |

### Cloud Storage & File Sync

| Service | Description | Docs |
|---------|-------------|------|
| [Nextcloud](https://nextcloud.com/) | Self-hosted productivity platform | [docs/nextcloud.md](docs/nextcloud.md) |
| [ownCloud](https://owncloud.com/) | Enterprise file sync and share | [docs/owncloud.md](docs/owncloud.md) |
| [Seafile](https://www.seafile.com/) | High-performance file sync | [docs/seafile.md](docs/seafile.md) |
| [Syncthing](https://syncthing.net/) | Continuous file synchronization | [docs/syncthing.md](docs/syncthing.md) |
| [File Browser](https://filebrowser.org/) | Web-based file management | [docs/filebrowser.md](docs/filebrowser.md) |
| [Samba](https://www.samba.org/) | SMB/CIFS network file sharing with TimeMachine support | [docs/samba.md](docs/samba.md) |

### Backup & Recovery

| Service | Description | Docs |
|---------|-------------|------|
| [Duplicati](https://www.duplicati.com/) | Free backup with cloud support | [docs/duplicati.md](docs/duplicati.md) |
| [Kopia](https://kopia.io/) | Fast and secure backup tool | [docs/kopia.md](docs/kopia.md) |
| [Compress & Encrypt](_archive/compress-and-encrypt/) | Automated backup compression/encryption | [docs/compress-and-encrypt.md](docs/compress-and-encrypt.md) |

### Photo & Gallery

| Service | Description | Docs |
|---------|-------------|------|
| [Immich](https://immich.app/) | Self-hosted photo/video backup (Google Photos alternative) | [docs/immich.md](docs/immich.md) |

### Documentation & Notes

| Service | Description | Docs |
|---------|-------------|------|
| [Docmost](https://docmost.com/) | Open-source Notion alternative | [docs/docmost.md](docs/docmost.md) |

### Reverse Proxy & Networking

| Service | Description | Docs |
|---------|-------------|------|
| [Traefik](https://traefik.io/) | Modern reverse proxy with Docker integration | [docs/traefik.md](docs/traefik.md) |
| [Nginx Proxy Manager](https://nginxproxymanager.com/) | Easy reverse proxy management with SSL | [docs/nginx-proxy-manager.md](docs/nginx-proxy-manager.md) |
| [Cloudflared](https://developers.cloudflare.com/cloudflare-one/) | Cloudflare Tunnel for Zero Trust access | [docs/cloudflared.md](docs/cloudflared.md) |
| [Twingate](https://www.twingate.com/) | Zero Trust Network Access | [docs/twingate.md](docs/twingate.md) |

### DNS & Network Services

| Service | Description | Docs |
|---------|-------------|------|
| [Pi-hole](https://pi-hole.net/) | Network-wide ad blocker | [docs/pihole.md](docs/pihole.md) |
| [DuckDNS](https://www.duckdns.org/) | Free dynamic DNS service | [docs/duckdns.md](docs/duckdns.md) |
| [No-IP](https://www.noip.com/) | Dynamic DNS update client | [docs/noip.md](docs/noip.md) |

### Dashboards & Monitoring

| Service | Description | Docs |
|---------|-------------|------|
| [Homepage](https://gethomepage.dev/) | Modern application dashboard | [docs/homepage.md](docs/homepage.md) |
| [Homarr](https://homarr.dev/) | Customizable dashboard | [docs/homarr.md](docs/homarr.md) |
| [Uptime Kuma](https://uptime.kuma.pet/) | Self-hosted monitoring tool | [docs/uptime-kuma.md](docs/uptime-kuma.md) |
| [Speedtest Tracker](https://github.com/alexjustesen/speedtest-tracker) | Internet speed monitoring | [docs/speedtest-tracker.md](docs/speedtest-tracker.md) |

### Container & DevOps Management

| Service | Description | Docs |
|---------|-------------|------|
| [Portainer](https://www.portainer.io/) | Docker management GUI | [docs/portainer.md](docs/portainer.md) |
| [GitLab](https://about.gitlab.com/) | Self-hosted DevOps platform | [docs/gitlab.md](docs/gitlab.md) |

### PDF & Document Tools

| Service | Description | Docs |
|---------|-------------|------|
| [Stirling PDF](https://stirlingtools.com/) | Self-hosted PDF manipulation (ILovePDF alternative) | [docs/stirling-tools.md](docs/stirling-tools.md) |

### Media Processing

| Service | Description | Docs |
|---------|-------------|------|
| [Tdarr](https://tdarr.io/) | Distributed transcoding system | [docs/tdarr.md](docs/tdarr.md) |

### Game Servers

| Service | Description | Docs |
|---------|-------------|------|
| [Pterodactyl](https://pterodactyl.io/) | Game server management panel | [docs/pterodactyl.md](docs/pterodactyl.md) |
| [Steam CS:GO](_archive/steam-csgo/) | Counter-Strike: GO dedicated server | [docs/steam-csgo.md](docs/steam-csgo.md) |
| [Steam Project Zomboid](_archive/steam-project-zomboid/) | Project Zomboid dedicated server | [docs/steam-project-zomboid.md](docs/steam-project-zomboid.md) |
| [Steam Rust](_archive/steam-rust/) | Rust dedicated server | [docs/steam-rust.md](docs/steam-rust.md) |
| [Steam Valheim](_archive/steam-valheim/) | Valheim dedicated server | [docs/steam-valheim.md](docs/steam-valheim.md) |

### Gaming & ROM Management

| Service | Description | Docs |
|---------|-------------|------|
| [RomM](https://github.com/rommapp/romm) | ROM manager and game library | [docs/romm.md](docs/romm.md) |

---

## Service Categories Quick Reference

| Category | Services |
|----------|----------|
| **Media** | Emby, Jellyfin, Jellyseerr, *arr stack |
| **Downloads** | qBittorrent, Transmission, Deluge, JDownloader2 |
| **Cloud Storage** | Nextcloud, ownCloud, Seafile, Syncthing, Samba |
| **Backup** | Duplicati, Kopia, Compress & Encrypt |
| **Network** | Traefik, NPM, Cloudflared, Twingate, Pi-hole |
| **Monitoring** | Uptime Kuma, Speedtest Tracker, Homepage |
| **Game Servers** | Pterodactyl, Steam game servers |
| **DevOps** | Portainer, GitLab |
