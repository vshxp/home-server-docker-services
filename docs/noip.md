# No-IP

Dynamic DNS update client.

## Overview

No-IP is a dynamic DNS service that allows you to access your home network using a hostname instead of an IP address. This container automatically updates your No-IP hostname when your IP changes.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `ghcr.io/noipcom/noip-duc:latest` |
| **Container Name** | `noip` |
| **Network** | `services` (external) |
| **Restart Policy** | `always` |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `POSTGRES_PASSWORD` | No-IP account password |
| `POSTGRES_DB` | No-IP hostname/group |
| `POSTGRES_USER` | No-IP username/email |

> **Note**: Variable names seem to be incorrectly named as POSTGRES_* in the original compose. These should typically be NOIP_USERNAME, NOIP_PASSWORD, etc.

## Features

- Automatic IP detection
- Regular update intervals
- Multiple hostname support
- IPv4 and IPv6 support
- Low resource usage

## No-IP vs DuckDNS

| Feature | No-IP | DuckDNS |
|---------|-------|---------|
| Free tier | Limited | Unlimited |
| Hostnames | 1-3 free | 5 per account |
| Confirmation | Monthly required | None |
| Custom domain | Paid | No |

## Setup Steps

1. Create account at [No-IP](https://www.noip.com/)
2. Create hostname(s)
3. Configure environment variables
4. Start the container

## Quick Start

1. Create `.env` file:
   ```bash
   POSTGRES_USER=your_noip_email
   POSTGRES_PASSWORD=your_noip_password
   POSTGRES_DB=your_hostname.ddns.net
   ```
2. Start the service: `hsds setup`
3. Verify update in No-IP dashboard

## Free Tier Limitations

- Maximum 3 hostnames
- Monthly confirmation required
- Limited to noip.com subdomains

## Use Cases

- Remote access to home server
- Dynamic IP management
- Domain pointing
- Combined with reverse proxy

## Verification

Check logs for successful updates:
```bash
docker logs noip
```

## Links

- [No-IP Website](https://www.noip.com/)
- [DUC Documentation](https://www.noip.com/support/knowledgebase/installing-the-linux-dynamic-update-client/)
