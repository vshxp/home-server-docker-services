#!/bin/bash

sudo apt update 
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install nfs-common git docker-compose -y

sudo mkdir /Storage
sudo mount 192.168.3.10:/storage/data /Storage


# Define the line to be added
LINE="192.168.3.10:/storage/data /Storage nfs rw,defaults 0 0"

# Check if the line already exists in /etc/fstab
if grep -Fxq "$LINE" /etc/fstab; then
    echo "The line is already present in /etc/fstab."
else
    # Add the line to /etc/fstab
    echo "$LINE" | sudo tee -a /etc/fstab > /dev/null
    echo "Line added to /etc/fstab."

    # Test the fstab configuration by mounting all filesystems
    sudo mount -a
    if [ $? -eq 0 ]; then
        echo "fstab updated and filesystems mounted successfully."
    else
        echo "Error: There was an issue updating fstab or mounting filesystems."
    fi
fi
