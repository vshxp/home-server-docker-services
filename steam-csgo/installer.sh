#!/bin/bash

########################################################################################
################################### PATH VARIABLES #####################################
########################################################################################

SERVER_PATH="~/Storage/Docker/steam/csgo"

########################################################################################
########################## DO NOT CHANGE ANYTHING ABOVE HERE! ##########################
########################################################################################

# Check if 7zip (p7zip) is installed using dnf package manager
echo "Checking if 7zip is installed..."

# Check if 7zip (p7zip) is installed using dnf package manager
if ! command -v 7z &>/dev/null; then
    echo "7zip (p7zip) is not installed. Installing it..."
    sudo apt install p7zip p7zip-rar p7zip-full 7zip -y
    if [ $? -ne 0 ]; then
        echo "[ERROR] Failed to install 7zip (p7zip). Exiting..."
        exit 1
    fi
    echo "7zip (p7zip) installed successfully."
else
    echo "7zip (p7zip) is already installed."
fi

# Function to show the progress bar
progress_bar() {
    local duration=$1
    local i=0
    local block="■"
    local empty="─"
    local progress=""
    local percentage=""
    
    while [[ $i -le $duration ]]; do
        percentage=$((i * 100 / duration))
        progress="${block:0:percentage / 2}${empty:0:(50 - percentage / 2)}"
        printf "\r[%s] %d%%" "$progress" "$percentage"
        sleep 1
        ((i++))
    done
    echo ""
}

echo "Installing Plugins"

# Function to check the return status of the command and display appropriate message
check_command_status() {
    if [ $? -eq 0 ]; then
        echo "  -> [OK] $1"
    else
        echo "  -> [ERROR] Failed to $2 $1 !"
        exit 1
    fi
}

echo "  Extracting Sourcemod"
(7z x sourcemod-1.11.0.7z -bd -bso0 -aoa -o$SERVER_PATH/serverfiles/csgo/ & progress_bar 10) 
check_command_status "Sourcemod" "extract"

echo "  Extracting Metamod"
(7z x mmsource-1.11.0.7z -bd -bso0 -aoa -o$SERVER_PATH/serverfiles/csgo/ & progress_bar 10) 
check_command_status "Metamod" "extract"

echo "  Installing Warmod"
cp ./warmod/warmod.smx  $SERVER_PATH/serverfiles/csgo/addons/sourcemod/plugins/
check_command_status "Warmod" "install"

echo "  Configuring Admins"
cp ./warmod/admins_simple.ini  $SERVER_PATH/serverfiles/csgo/addons/sourcemod/configs/
check_command_status "Admin" "install"

echo "  Adding custom configs"
cp ./configs/motd.txt $SERVER_PATH/serverfiles/csgo/motd.txt
check_command_status "Custom configs" "install"


echo "All plugins installed successfully."



