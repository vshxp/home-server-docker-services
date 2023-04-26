# Home server docker services
List of docker services

## Requirements
- docker
- docker-compose

## How to install
Just run the install command.
```bash
./fedora-docker-auto-installer.sh
```
```bash
./debian-docker-auto-installer.sh
```

# Organization Service

## Homer
A dead simple static HOMepage for your servER to keep your services on hand, from a simple yaml configuration file.
| Service       | Port  | 
|---------------|:------|
| homer         | 80    |


# Tools

## PiHole
Pi-hole is a Linux network-level advertisement and Internet tracker blocking application which acts as a DNS sinkhole and optionally a DHCP server, intended for use on a private network.
| Service       | Port  | 
|---------------|:------|
| DNS           | 53    |
| PiHole        | 81    |
* Required stop services running on port `53` - dns service

## Syncthing
Similar ao Dropbox 
| Service       | Port  | 
|---------------|:------|
| Syncthing     | 8384  |


# Media Services
All services used to share your ~~pirate~~ videos 

## Bazarr
Bazarr is a companion application to Sonarr and Radarr that manages and downloads subtitles based on your requirements.
| Service       | Port  | 
|---------------|:------|
| qbittorrent   | 6767  |

## Emby
Media server designed to organize, play, and stream audio and video to a variety of devices. (I preffer emby besause it has yellow subtitles) (similar to plex and jellyfin)
| Service       | Port  | 
|---------------|:------|
| emby          | 8096  |

## Jellyfin
Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached.
| Service       | Port  | 
|---------------|:------|
| Jellyfin      | 8097  |

## Jellyseerr
Jellyseerr is a free and open source software application for managing requests for your media library. It integrates with Jellyfin
| Service       | Port  | 
|---------------|:------|
| Jellyseerr    | 5055  |


## Prowlarr
Prowlarr is an `indexer` manager/proxy that integrate with  various PVR apps. Prowlarr supports both torrent trackers and Usenet indexers. It integrates seamlessly with Lidarr, Radarr, Readarr, and Sonarr, offering automated management of your indexers with no per-app indexer configuration required.
| Service       | Port  | 
|---------------|:------|
| Prowlarr      | 9696  |

## qbittorrent
qBittorrent is a cross-platform free and open-source `BitTorrent client` written in native C++.
| Service       | Port  | 
|---------------|:------|
| qbittorrent   | 8080  |

## Radarr
https://radarr.video/

Radarr is a `movie` collection manager for Usenet and BitTorrent clients. It can monitor multiple feeds for new movies and will interface with clients and indexers to download them.
| Service       | Port  | 
|---------------|:------|
| Radarr        | 7878  |

## Sonarr
Sonarr is a `tv-show` collection manager for Usenet and BitTorrent clients. (same as Radarr but for tv-shows)
| Service       | Port  | 
|---------------|:------|
| Sonarr        | 8989  |

## TubeSync
Listen youtube playlists and download it contents.
It's used to download videos from a specific playlist from youtube to your server
| Service       | Port  | 
|---------------|:------|
| Sonarr        | 4848  |