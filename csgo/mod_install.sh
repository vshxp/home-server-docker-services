echo "Installing Plugins"
tar -xzf sourcemod-1.11.0-git6934-linux.tar.gz -C ~/Storage/Docker/steam/csgo/serverfiles/csgo/
echo "  -> [OK] Sourcemod"

tar -xzf mmsource-1.11.0-git1148-linux.tar.gz -C ~/Storage/Docker/steam/csgo/serverfiles/csgo/
echo "  -> [OK] Metamod"

cp ./warmod/warmod.smx  ~/Storage/Docker/steam/csgo/serverfiles/csgo/addons/sourcemod/plugins/
echo "  -> [OK] Warmod"


echo "Installing Configs"
echo "  -> CFG Admins [OK]"
cp ./warmod/admins_simple.ini ~/Storage/Docker/steam/csgo/serverfiles/csgo/addons/sourcemod/configs/admins_simple.ini
echo "  -> CFG Treino [OK]"
cp ./warmod/cfg/treino.cfg ~/Storage/Docker/steam/csgo/serverfiles/csgo/cfg/sourcemod/
echo "  -> Tick 128 [OK]"
cp ./LinuxGSM/common.cfg ~/Storage/Docker/steam/csgo/config-lgsm/csgoserver/

echo "Server Configuration Completed!"
