#!/bin/bash

source .env

echo "Running SteamRT container"
docker run -it \
           --hostname "$STEAMOS_HOSTNAME" \
           --restart unless-stopped \
           --name "$STEAMOS_CONTAINER_NAME" \
           "$STEAMOS_IMAGE_NAME"
