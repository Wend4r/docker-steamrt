#!/bin/sh

STEAMRT_SNIPER_IMAGE_NAME=steamrt-sniper
STEAMRT_SNIPER_CONTAINER_NAME=steamrt-sniper
STEAMRT_SNIPER_HOSTNAME=steamrt-sniper

docker run -it \
           --hostname "$STEAMRT_SNIPER_HOSTNAME" \
           --restart unless-stopped \
           --name "$STEAMRT_SNIPER_CONTAINER_NAME" \
           "$STEAMRT_SNIPER_IMAGE_NAME"
