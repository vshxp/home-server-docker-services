# Home server docker services

The definitive services for your home server.

![](banner.png)

## Requirements
Any Debian based linux distribution.

## How to install
Just run the install command. It ll install docker and all dependencies to run the services.

```bash
./debian-auto-installer.sh
```

## Services

| Service | Description |
|--|--|
| [bazarr]() | Tool for managing subtitles on your media server. |
| [cloudflared]() | Used to expose services through a ZTNA network. |
| [docmost]() | Used for taking notes. Very similar to Notion but open source. |
| [duckdns]() | Free DNS service. |
| [emby]() | The best app for managing streams (in my opinion). It integrates with Jellyseerr, Sonarr, and Radarr. |
| [filebrowser]() | A simple HTTP file share that allows users to upload their files. |
| [homepage]() | A simple dashboard for easy access to your services. |
| [jdownloader2]() | An HTTP downloader that supports multiple file hosting services. |
| [jellyseerr]() | Used to request new movies and TV shows. It integrates with Emby, Sonarr, and Radarr. |
| [uptime-kuma]() | Used to monitor the health of your services. |
| [nextcloud]() | Open-source cloud storage, similar to Google Drive. |
| [nginx-proxy-manager]() | A highly recommended proxy manager. |
| [Prowlarr]() | Used to index torrent websites. |
| [Radarr]() | Used to download movies from Prowlarr. |
| [Sonarr]() | Used to download TV shows from Prowlarr. |
| [Speedtest-tracker]() | Monitors your internet speed. |
| [Stirling-tools]() | Similar to I Love PDF. |
| [Transmission]() | A lightweight torrent client. |
| [twingate]() | A ZTNA service for accessing your home server remotely. |
