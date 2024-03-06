# Home server docker services

## How to install
Just run the install command. it ll install docker and all dependencies to run the services.

```bash
./debian-auto-installer.sh
```

# Services & Ports
| Service       | Port  | 
|---------------|:------|
| homer         | 80    |
| DNS           | 53    |
| PiHole        | 81    |
| Syncthing     | 8384  |
| qbittorrent   | 6767  |
| emby          | 8096  |
| Jellyseerr    | 5055  |
| Jellyfin      | 8097  |
| Prowlarr      | 9696  |
| qbittorrent   | 8080  |
| Radarr        | 7878  |
| Sonarr        | 8989  |
| Sonarr        | 4848  |
| JDownloader   | 5800  |
| Kuma          | 3001  |
| Nextcloud     | 8443  |
| Tdarr         | 8265  |
| CSGO          | 27015 |
| Zomboid       | 16261, 16262  |
| Valheim       | 2456  |

# Service Description

## Homer
A simple static homepage for your server to keep your services on hand, from a simple yaml configuration file.

## PiHole
Pi-hole is a Linux network-level advertisement and Internet tracker blocking application which acts as a DNS sinkhole and optionally a DHCP server, intended for use on a private network.

* Required stop services running on port `53` - dns service

## Syncthing
Similar to Dropbox 

## Bazarr
Bazarr is a companion application to Sonarr and Radarr that manages and downloads subtitles based on your requirements.

## Emby
Media server designed to organize, play, and stream audio and video to a variety of devices. (I preffer emby besause it has yellow subtitles) (similar to plex and jellyfin)

## Jellyfin
Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached.

## Jellyseerr
Jellyseerr is a free and open source software application for managing requests for your media library. It integrates with Jellyfin

## Prowlarr
Prowlarr is an `indexer` manager/proxy that integrate with  various PVR apps. Prowlarr supports both torrent trackers and Usenet indexers. It integrates seamlessly with Lidarr, Radarr, Readarr, and Sonarr, offering automated management of your indexers with no per-app indexer configuration required.

## qbittorrent
qBittorrent is a cross-platform free and open-source `BitTorrent client` written in native C++.

## Radarr
https://radarr.video/

Radarr is a `movie` collection manager for Usenet and BitTorrent clients. It can monitor multiple feeds for new movies and will interface with clients and indexers to download them.

## Sonarr
Sonarr is a `tv-show` collection manager for Usenet and BitTorrent clients. (same as Radarr but for tv-shows)

## tubeSync
Listen youtube playlists and download it contents.
It's used to download videos from a specific playlist from youtube to your server

## Kuma
Network monitoring

## speedtest-tracker
Internet speed monitor
