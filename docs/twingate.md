# Twingate

Zero Trust Network Access solution.

## Overview

Twingate is a Zero Trust Network Access (ZTNA) solution that allows secure remote access to your network without traditional VPNs. It provides software-defined perimeter security for accessing your home server and services remotely.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `twingate/connector:1` |
| **Container Name** | `twingate` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |
| **Pull Policy** | `always` |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `TWINGATE_NETWORK` | Your Twingate network name |
| `TWINGATE_ACCESS_TOKEN` | Connector access token |
| `TWINGATE_REFRESH_TOKEN` | Connector refresh token |
| `TWINGATE_LABEL_HOSTNAME` | Connector hostname label |
| `TWINGATE_DNS` | DNS server for connector |
| `TWINGATE_LOG_ANALYTICS` | Enable logging analytics |
| `TWINGATE_LABEL_DEPLOYED_BY` | Deployment label |

## Prerequisites

1. Create account at [Twingate](https://www.twingate.com/)
2. Create a network
3. Deploy a connector
4. Get connector tokens

## Setup Steps

### 1. Create Twingate Account
- Go to [admin.twingate.com](https://admin.twingate.com/)
- Create network

### 2. Deploy Connector
- Navigate to **Connectors**
- Create new connector
- Copy access and refresh tokens

### 3. Define Resources
- Add resources (services to access)
- Set access policies
- Configure DNS

## Quick Start

1. Create `.env` file with Twingate tokens:
   ```bash
   TWINGATE_NETWORK=your-network
   TWINGATE_ACCESS_TOKEN=<access_token>
   TWINGATE_REFRESH_TOKEN=<refresh_token>
   TWINGATE_LABEL_HOSTNAME=home-server
   TWINGATE_DNS=1.1.1.1
   TWINGATE_LOG_ANALYTICS=false
   TWINGATE_LABEL_DEPLOYED_BY=docker
   ```
2. Start the service: `hsds setup`
3. Verify connector is online in dashboard
4. Install Twingate client on devices

## Benefits

| Feature | Description |
|---------|-------------|
| No Port Forwarding | No inbound ports needed |
| Zero Trust | Verify every request |
| Easy Setup | No complex VPN config |
| Split Tunneling | Only route specific traffic |
| MFA Support | Multi-factor authentication |

## Twingate vs Traditional VPN

| Aspect | Twingate | VPN |
|--------|----------|-----|
| Setup | Simple | Complex |
| Security | Zero Trust | Perimeter |
| Performance | Split tunnel | All traffic |
| Ports | None required | Port forward |

## Client Applications

Install on devices to connect:
- Windows
- macOS
- Linux
- iOS
- Android

## Use Cases

- Remote access to home services
- Secure access to NAS/storage
- Access internal web apps
- SSH to home servers
- Team access management

## Resource Types

Define what can be accessed:
- IP addresses
- IP ranges
- DNS names
- Wildcards

## Free Tier

Twingate offers free tier:
- Up to 5 users
- 1 remote network
- Basic features

## Links

- [Official Website](https://www.twingate.com/)
- [Documentation](https://docs.twingate.com/)
- [Admin Console](https://admin.twingate.com/)
