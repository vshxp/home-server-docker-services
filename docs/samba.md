# Samba

Network file sharing with SMB/CIFS protocol.

## Overview

Samba is a free software re-implementation of the SMB networking protocol. This container provides a full-featured Samba server with TimeMachine support, Avahi (zeroconf) for network discovery, and WSD (wsdd2) for Windows network discovery.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `ghcr.io/servercontainers/samba` |
| **Container Name** | `samba` |
| **SMB Port** | `445` |
| **NetBIOS Port** | `137-138` (UDP) |
| **Network Mode** | `host` |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

### User/Group Configuration

| Variable | Description | Example |
|----------|-------------|---------|
| `ACCOUNT_<user>` | Create user with password | `ACCOUNT_user=password` |
| `UID_<user>` | Set user ID | `UID_user=1000` |
| `GROUP_<group>` | Create group with GID | `GROUP_family=1500` |
| `GROUPS_<user>` | Add user to groups | `GROUPS_user=family` |

### Share Configuration

| Variable | Description |
|----------|-------------|
| `SAMBA_VOLUME_CONFIG_<name>` | Define share with bracketed config |
| `SAMBA_GLOBAL_CONFIG_<key>` | Global Samba configuration |

### Service Configuration

| Variable | Description | Default |
|----------|-------------|---------|
| `SAMBA_CONF_WORKGROUP` | Workgroup name | `WORKGROUP` |
| `SAMBA_CONF_SERVER_STRING` | Server description | `Samba Server` |
| `SAMBA_CONF_MAP_TO_GUEST` | Guest access handling | `Bad User` |
| `AVAHI_DISABLE` | Disable Avahi (zeroconf) | `false` |
| `WSDD2_DISABLE` | Disable WSD (Windows discovery) | `false` |

## Volume Configuration

Shares are configured via environment variables:

```yaml
environment:
  - SAMBA_VOLUME_CONFIG_share=[Share Name]; path=/shares/data; valid users = user; guest ok = no; read only = no; browseable = yes
```

### Share Options

| Option | Description |
|--------|-------------|
| `path` | Container path to share |
| `valid users` | Allowed users |
| `guest ok` | Allow guest access |
| `read only` | Read-only access |
| `browseable` | Show in network browser |
| `force user` | Force file ownership |
| `force group` | Force group ownership |
| `create mask` | New file permissions |
| `directory mask` | New directory permissions |

## Features

- SMB/CIFS file sharing
- TimeMachine backup support
- Avahi/Bonjour (zeroconf) discovery
- WSD (wsdd2) for Windows discovery
- Multi-user support
- Group-based permissions
- Guest access options
- Custom share configurations

## Quick Start

1. Create `docker-compose.yml`:
   ```yaml
   services:
     samba:
       image: ghcr.io/servercontainers/samba
       container_name: samba
       network_mode: host
       restart: unless-stopped
       environment:
         - ACCOUNT_user=password
         - UID_user=1000
         - SAMBA_VOLUME_CONFIG_data=[Data]; path=/shares/data; valid users = user; guest ok = no; read only = no; browseable = yes
       volumes:
         - /path/to/data:/shares/data
   ```

2. Start the service: `hsds setup`
3. Access via `\\<hostname>\Data` (Windows) or `smb://<hostname>/Data` (macOS/Linux)

## TimeMachine Setup

Enable TimeMachine backup support:

```yaml
environment:
  - SAMBA_VOLUME_CONFIG_timemachine=[TimeMachine]; path=/shares/timemachine; valid users = user; guest ok = no; read only = no; browseable = yes; fruit:time machine = yes
```

## Network Mode

This container uses `network_mode: host` for:
- Proper zeroconf/Avahi functionality
- Windows network discovery (WSD)
- NetBIOS name resolution

## Security Considerations

- Use strong passwords for user accounts
- Limit share access with `valid users`
- Consider firewall rules for SMB ports
- Use `read only = yes` where appropriate

## Troubleshooting

### Cannot see server on network
- Ensure `network_mode: host` is set
- Check if Avahi/WSD are enabled
- Verify firewall allows SMB ports

### Permission denied
- Check `valid users` setting
- Verify user credentials
- Check file/directory ownership

### TimeMachine not discovering
- Ensure `fruit:time machine = yes` is set
- Check Avahi is enabled
- Verify network connectivity

## Links

- [GitHub Repository](https://github.com/ServerContainers/samba)
- [Docker Hub](https://hub.docker.com/r/servercontainers/samba)
- [Samba Documentation](https://www.samba.org/samba/docs/)
