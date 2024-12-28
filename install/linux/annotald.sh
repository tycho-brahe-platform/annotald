#!/bin/bash

# Ensure Zenity is installed
if ! command -v zenity &> /dev/null; then
    echo "Zenity is not installed. Please install it and try again."
    exit 1
fi

# Open file chooser dialog to select a PSD file
filePath=$(zenity --file-selection --title="Select a PSD file to edit")

# Check if a file was selected
if [[ -z "$filePath" ]]; then
    echo "No file selected. Exiting."
    exit 1
fi

# Run the Docker container with the selected file
folder=$(dirname "$filePath")
filename=$(basename "$filePath")

docker run --rm --name annotald -p 8080:8080 -v "$folder":/data tychobrahe/annotald python bin/annotald /data/"$filename"
