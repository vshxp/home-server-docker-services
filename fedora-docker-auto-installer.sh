#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Installing Docker..."
    sudo dnf install docker docker-compose -y
    sudo systemctl start docker
    sudo systemctl enable docker
    echo "Docker installed successfully."
else
    echo "Docker is already installed."
fi

# Set the path to the directory containing subdirectories
path="."

# Loop through all subdirectories in the path
for dir in "$path"/*; do
    # Check if the current item is a directory
    if [[ -d "$dir" ]]; then
        # Perform your command on the current subdirectory
        echo "Turning up: $dir";
        cd $dir;
        docker-compose up -d;
        cd ..;
    fi
done