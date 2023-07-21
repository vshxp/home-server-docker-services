echo "Installing Sourcemod"
cp -R ./Sourcemod/*  ~/Storage/Docker/steam/csgo/serverfiles/csgo/
echo "Installing Metamod"
cp -R ./Metamod/*  ~/Storage/Docker/steam/csgo/serverfiles/csgo/
echo "Installing Warmod"
cp ./warmod/warmod.smx  ~/Storage/Docker/steam/csgo/serverfiles/csgo/addons/sourcemod/plugins/

echo "Install Configs"

mv ./warmod/admins_simple.ini ~/StorageDocker/steam/csgo/serverfiles/csgo/addons/sourcemod/configs/admins_simple.ini