# Pi-hole

Network-wide ad blocker.

## Overview

Pi-hole is a DNS sinkhole that protects your devices from unwanted content without installing any client-side software. It blocks ads at the DNS level, improving network performance and privacy.

## Service Details

| Property | Value |
|----------|-------|
| **Image** | `pihole/pihole:latest` |
| **Container Name** | `pihole` |
| **DNS Port** | `53` (TCP/UDP) |
| **Web UI Port** | `82` (mapped from 80) |
| **Network** | `services` (external) |
| **Restart Policy** | `unless-stopped` |

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `TZ` | Timezone | `America/Sao_Paulo` |
| `WEBPASSWORD` | Admin panel password | From `${PIHOME_WEBPASSWORD}` |
| `DNSMASQ_LISTENING` | DNS listening mode | `all` |
| `FTLCONF_LOCAL_IPV4` | Server IP address | Required |
| `DNSMASQ_USER` | DNS user | `root` |
| `PIHOLE_UID` | User ID | `0` |

## Volumes

| Volume | Purpose |
|--------|---------|
| `pi-hole:/etc/pihole` | Configuration |
| `pi-hole:/etc/dnsmasq.d` | DNS configuration |

## Capabilities

```yaml
cap_add:
  - NET_ADMIN  # Required for DHCP and network management
```

## Features

- Network-wide ad blocking
- Custom blocklists
- Query logging
- Statistics dashboard
- DHCP server (optional)
- DNS over HTTPS (DoH)
- Local DNS records

## Network Configuration

Point your router's DNS to Pi-hole's IP, or configure devices individually.

### Router Configuration
Set DNS server to: `<Pi-hole IP>`

### Per-Device
Configure DNS in network settings.

## Quick Start

1. Create `.env` file:
   ```bash
   PIHOME_WEBPASSWORD=secure_password
   FTLCONF_LOCAL_IPV4=192.168.1.x
   ```
2. Start the service: `hsds setup`
3. Access admin at `http://<host>:82/admin`
4. Configure router/devices to use Pi-hole DNS

## Blocklists

Default lists block:
- Ads
- Trackers
- Malware domains

Add custom lists in **Settings** → **Blocklists**

## Local DNS

Add local DNS records:
- **Local DNS** → **DNS Records**
- Map hostnames to local IPs
- Access services by name

## Statistics

Dashboard shows:
- Total queries
- Queries blocked (%)
- Clients
- Top blocked domains

## Troubleshooting

Check DNS is working:
```bash
nslookup google.com <pihole-ip>
```

View logs:
```bash
docker logs pihole
```

## Links

- [Official Website](https://pi-hole.net/)
- [Documentation](https://docs.pi-hole.net/)
- [Blocklist Collection](https://firebog.net/)
