# Pi-Hole
A DNS server


## setup
Stop and disable systemd-resolved.service
```
sudo systemctl stop systemd-resolved.service

sudo systemctl disable systemd-resolved.service

sudo systemctl status systemd-resolved.service

```

change the dns ip to 1.1.1.1 -> this will allow the server do resolve dns names

```
sudo nano /etc/resolv.conf
```