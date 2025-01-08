#!/bin/bash

source .env

echo "Running SteamRT container"
docker run -it \
           --hostname "$STEAMRT_HOSTNAME" \
           --restart unless-stopped \
           --name "$STEAMRT_CONTAINER_NAME" \
           "$STEAMRT_IMAGE_NAME"
