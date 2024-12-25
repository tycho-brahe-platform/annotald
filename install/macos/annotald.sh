#!/bin/bash

# Prompt the user for a file selection
osascript <<EOF
tell application "Finder"
    activate
    set psdFile to choose file with prompt "Select a PSD file to edit"
    set filePath to POSIX path of psdFile
end tell
EOF

# Run the Docker container with the selected file
if [ "$filePath" != "" ]; then
    folder=$(dirname "$filePath")
    filename=$(basename "$filePath")
    docker rm -f annotald || true
    docker run -it --rm --name annotald -p 8080:8080 -v "$folder":/data tychobrahe/annotald python bin/annotald /data/"$filename"
    open http://localhost:8080
else
    echo "No file selected. Exiting."
fi