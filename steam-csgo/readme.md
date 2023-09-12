# CSGO CoBrA Server

1. Run the container
```
docker-compose up -d
```

2. Edit the Config Files 
    - `warmod/admins_simple.ini` -> Add your steam ID
    - `LinuxGSM/commom.cfg`      -> Add your STEAM TOKEN

2. Install the competitive mods
This command will give execution permission to script and it will install the plugins Metamod & Sourcemod and also will install the configuration files.
```
chmod +x installer.sh
./installer.sh
```

3. Join the server
```
connect YOUR_SERER_IP:27015;password YOUR_SERVER_PASSWORD
```