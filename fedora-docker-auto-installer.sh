#!/bin/bash

# Set the path to the directory containing subdirectories
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