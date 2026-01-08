# GitLab

Self-hosted DevOps platform.

## Overview

GitLab is a complete DevOps platform that enables teams to collaborate on code, manage CI/CD pipelines, and handle the entire software development lifecycle. This setup includes both the GitLab server and a GitLab Runner for CI/CD.

## Service Details

### GitLab Server

| Property | Value |
|----------|-------|
| **Image** | `gitlab/gitlab-ce:latest` |
| **Container Name** | `gitlab-server` |
| **Web UI Port** | `8088` |
| **Restart Policy** | `always` |

### GitLab Runner

| Property | Value |
|----------|-------|
| **Image** | `gitlab/gitlab-runner:alpine` |
| **Container Name** | `gitlab-runner` |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `GITLAB_URL` | External URL for GitLab |
| `GITLAB_PORT` | Nginx listen port |
| `GITLAB_ROOT_PASSWORD` | Initial root password |

## Configuration

GitLab Omnibus configuration:
```ruby
external_url ${GITLAB_URL}
nginx['listen_port'] = ${GITLAB_PORT}
gitlab_rails['initial_root_password'] = ${GITLAB_ROOT_PASSWORD}
puma['worker_processes'] = 0  # Saves memory
```

## Volumes

| Host Path | Container Path | Purpose |
|-----------|---------------|---------|
| `/Storage/.Docker/gitlab/server/config` | `/etc/gitlab` | Configuration |
| `/Storage/.Docker/gitlab/server/logs` | `/var/log/gitlab` | Log files |
| `/Storage/.Docker/gitlab/server/data` | `/var/opt/gitlab` | Data storage |

## Runner Configuration

The runner mounts Docker socket for Docker-in-Docker capabilities:
```yaml
volumes:
  - /var/run/docker.sock:/var/run/docker.sock
```

## Resource Requirements

GitLab is resource-intensive:
- **Minimum RAM**: 4GB
- **Recommended RAM**: 8GB+
- **CPU**: 2+ cores
- **Storage**: 50GB+ for repositories

## Quick Start

1. Create `.env` file:
   ```bash
   GITLAB_URL=http://gitlab.local:8088
   GITLAB_PORT=8088
   GITLAB_ROOT_PASSWORD=secure_password
   ```
2. Start the service: `hsds setup`
3. Wait 3-5 minutes for initialization
4. Access at `http://<host>:8088`
5. Login as `root` with configured password

## Register Runner

```bash
docker exec -it gitlab-runner gitlab-runner register
```

## Features

- Git repository management
- CI/CD pipelines
- Issue tracking
- Container registry
- Wiki and snippets
- Code review

## Links

- [Official Documentation](https://docs.gitlab.com/)
- [GitLab Runner Docs](https://docs.gitlab.com/runner/)
