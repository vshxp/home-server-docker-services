#!/bin/bash
apt update
apt remove docker docker-engine docker.io -y

apt install apt-transport-https \
ca-certificates \
curl \
software-properties-common \
docker-compose -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable" 

apt update
apt install docker-ce

clear
echo '[DONE] Docker Install'

path="."

# Loop through all subdirectories in the path
for dir in "$path"/*; do
    # Check if the current item is a directory
    if [[ -d "$dir" ]]; then
        # Perform your command on the current subdirectory
        echo "Turning up: $dir";
        docker-compose up -d;
    fi
done