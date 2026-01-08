# Cloudflared

Cloudflare Tunnel connector for Zero Trust Network Access.

## Overview

Cloudflared creates a secure tunnel between your server and Cloudflare's edge network, allowing you to expose services without opening ports on your firewall. This enables Zero Trust Network Access (ZTNA) for your home server.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `cloudflare/cloudflared:latest` |
| **Container Name** | `cloudflare-tunnel` |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `TUNNEL_TOKEN` | Cloudflare tunnel authentication token | Required |

## Command

```yaml
command: tunnel --no-autoupdate run
```

## Prerequisites

1. Cloudflare account
2. Domain configured with Cloudflare DNS
3. Tunnel created in Cloudflare Zero Trust dashboard
4. Tunnel token obtained from Cloudflare dashboard

## Setup Steps

1. Log in to [Cloudflare Zero Trust](https://one.dash.cloudflare.com/)
2. Navigate to **Networks** > **Tunnels**
3. Create a new tunnel
4. Copy the tunnel token
5. Add token to `.env` file as `TUNNEL_TOKEN`
6. Configure public hostnames for your services

## Security Features

- No inbound ports required
- End-to-end encryption
- Access policies via Cloudflare Access
- DDoS protection included
- Automatic SSL certificates

## Quick Start

1. Create `.env` file:
   ```bash
   TUNNEL_TOKEN=your_tunnel_token_here
   ```
2. Start the service: `hsds setup`
3. Configure routes in Cloudflare dashboard

## Links

- [Cloudflare Tunnels Documentation](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/)
- [Cloudflare Zero Trust](https://www.cloudflare.com/products/zero-trust/)
