# Speedtest Tracker

Internet speed monitoring.

## Overview

Speedtest Tracker is a self-hosted internet performance tracking application that runs speedtests against Ookla's Speedtest service and stores the results in a database for historical analysis.

## Service Details

| Component | Image | Container |
|-----------|-------|-----------|
| **App** | `lscr.io/linuxserver/speedtest-tracker:latest` | `speedtest-tracker` |
| **Database** | `postgres:16-alpine` | `speedtest-tracker-db` |

## Environment Variables

Configured via `.env` file:
- Database credentials
- `PRIVATE_DOMAIN` for Traefik

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/speedtest/config` | `/config` | Configuration |
| `db` | `/var/lib/postgresql/data` | Database |

## Resource Limits

| Component | Memory |
|-----------|--------|
| App | 256M |
| Database | 512M |

## Traefik Integration

```yaml
labels:
  - traefik.enable=true
  - traefik.http.routers.speedtest-tracker.rule=Host(`${PRIVATE_DOMAIN}`)
  - traefik.http.services.speedtest-tracker.loadbalancer.server.port=80
```

## Features

- Automated speedtests
- Historical data tracking
- Beautiful dashboard
- Configurable schedule
- Multiple speedtest servers
- Threshold alerts
- Data export

## Default Schedule

Tests run every hour by default. Configure in settings.

## Dashboard Metrics

- Download speed
- Upload speed
- Ping/Latency
- Jitter
- Historical graphs
- Averages

## Quick Start

1. Create `.env` file with credentials
2. Start the service: `hsds setup`
3. Access via configured domain
4. Configure test schedule
5. View results on dashboard

## Configuration Options

| Setting | Description |
|---------|-------------|
| Schedule | Cron expression for tests |
| Server | Specific speedtest server |
| Threshold | Alert thresholds |

## Data Analysis

View trends:
- Daily averages
- Weekly patterns
- ISP performance issues
- Peak usage times

## Use Cases

- Monitor ISP performance
- Document connection issues
- Verify advertised speeds
- Track network improvements

## API Access

Export data via API for external analysis.

## Links

- [GitHub Repository](https://github.com/alexjustesen/speedtest-tracker)
- [LinuxServer.io Image](https://docs.linuxserver.io/images/docker-speedtest-tracker)
