set custom dns on host

```shell
sudo nano /etc/systemd/resolved.conf
```

edit the line adding the custom dns

```shell
sudo systemctl restart systemd-resolved
```
