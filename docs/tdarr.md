# Tdarr

Distributed transcoding system.

## Overview

Tdarr is a distributed transcoding system for automating media library transcoding/remux management. It helps optimize your media library by converting files to more efficient codecs like HEVC/H.265.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `haveagitgat/tdarr` |
| **Container Name** | `tdarr` |
| **Web UI Port** | `8265` |
| **Server Port** | `8266` |
| **Network** | `media` (external) |
| **Restart Policy** | Default |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `serverIP` | Server bind address | `0.0.0.0` |
| `webUIPort` | Web interface port | `8265` |
| `serverPort` | Server port | `8266` |
| `TZ` | Timezone | `America/Sao_Paulo` |
| `PUID` | User ID | `1000` |
| `PGID` | Group ID | `1000` |
| `NVIDIA_DRIVER_CAPABILITIES` | NVIDIA features | `all` |
| `NVIDIA_VISIBLE_DEVICES` | NVIDIA devices | `all` |

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/Media/tv-shows` | `/home/Tdarr/Media/tv-shows` | Media library |
| `/Storage/.Docker/tdadd/app` | `/app/server` | Server data |
| `/Storage/.Docker/tdadd/configs` | `/app/configs` | Configuration |
| `/Storage/.Docker/tdadd/logs` | `/app/logs` | Log files |

## Architecture

```
Tdarr Server (Web UI + Scheduler)
         ↓
    Tdarr Node(s) (Workers)
         ↓
    Media Library
```

## Features

- Distributed transcoding
- GPU acceleration (NVIDIA/Intel)
- Plugin system
- Scheduling
- Health checks
- Audio/Video analysis
- Custom processing flows

## GPU Acceleration

### NVIDIA
Already configured in compose:
```yaml
environment:
  - NVIDIA_DRIVER_CAPABILITIES=all
  - NVIDIA_VISIBLE_DEVICES=all
```

### Intel QuickSync
Add device:
```yaml
devices:
  - /dev/dri:/dev/dri
```

## Quick Start

1. Start the service: `hsds setup`
2. Access web UI at `http://<host>:8265`
3. Add library
4. Configure plugins
5. Start processing

## Plugins

Popular plugins:
- **Migz-Transcode**: Video transcoding to HEVC
- **Migz-Clean Subs**: Subtitle management
- **Audio Converter**: Audio format conversion

## Library Setup

1. Add library in web UI
2. Set source folder
3. Configure transcode cache
4. Select plugins
5. Enable library

## Processing Flow

1. **Source**: Original files scanned
2. **Analysis**: Files analyzed for issues
3. **Queue**: Files queued for processing
4. **Transcode**: Workers process files
5. **Replace**: Original replaced with output

## Resource Management

- Set worker limits
- Configure GPU allocation
- Schedule processing times
- Priority management

## Links

- [Official Website](https://tdarr.io/)
- [Documentation](https://docs.tdarr.io/)
- [GitHub Repository](https://github.com/HaveAGitGat/Tdarr)
