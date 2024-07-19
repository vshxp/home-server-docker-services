#!/bin/bash

# Define input and output directories
input_dir="/input_dir/"
output_dir="/output_dir/"

# Check for COMPRESS_PASSWORD environment variable
if [ -z "$COMPRESS_PASSWORD" ]; then
    echo "Warning: COMPRESS_PASSWORD environment variable is not set. No encryption will be applied."
    encrypt_option=""
else
    encrypt_option="-P $COMPRESS_PASSWORD"
fi

# Get the current date
current_date=$(date +%Y-%m-%d)
current_time=$(date +%H-%M-%S)

# Compress and encrypt each folder found in the input directory
for folder in "$input_dir"*/; do
    # Remove trailing slash for folder name
    folder_name=$(basename "$folder")

    output_zip="${output_dir}${current_date}_${current_time}-backup-${folder_name}.zip"

    if [ -z "$encrypt_option" ]; then
        zip -r "$output_zip" "$folder"
    else
        zip -r $encrypt_option "$output_zip" "$folder"
    fi
done
