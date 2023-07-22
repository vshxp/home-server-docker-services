# CSGO CoBrA Server

1. Run the container
```
docker-compose up -d
```

2. Edit the Config Files 
    - `warmod/admins_simple.ini`
2. Install the competitive mods
This command will run a script to move the config files to the right place and also will install metamod and Sourcemod
```
./mod_install.sh
```

3. Join the server
```
connect cobrateam.servegame.com:27015;password cobramito
```