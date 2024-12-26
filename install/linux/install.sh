#!/bin/bash

# Script to pull the annotald Docker image
echo "Pulling the Docker image tychobrahe/annotald..."
docker pull tychobrahe/annotald

# Check if the command succeeded
if [ $? -eq 0 ]; then
    echo "Docker image tychobrahe/annotald pulled successfully!"
else
    echo "Failed to pull the Docker image tychobrahe/annotald."
fi
