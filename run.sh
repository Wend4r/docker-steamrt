#!/bin/bash

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

STEAMRT_SNIPER_DATA_DIR="$SCRIPT_DIR/data"
STEAMRT_SNIPER_IMAGE_NAME=`cat "$STEAMRT_SNIPER_DATA_DIR/image_name.txt"`
STEAMRT_SNIPER_CONTAINER_NAME=`cat "$STEAMRT_SNIPER_DATA_DIR/container_name.txt"`
STEAMRT_SNIPER_HOSTNAME=`cat "$STEAMRT_SNIPER_DATA_DIR/hostname.txt"`

docker run -it \
           --hostname "$STEAMRT_SNIPER_HOSTNAME" \
           --restart unless-stopped \
           --name "$STEAMRT_SNIPER_CONTAINER_NAME" \
           "$STEAMRT_SNIPER_IMAGE_NAME"
