#!/bin/bash

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

STEAMRT_DATA_DIR="$SCRIPT_DIR/data"
STEAMRT_IMAGE_NAME=`cat "$STEAMRT_DATA_DIR/image_name.txt"`
STEAMRT_CONTAINER_NAME=`cat "$STEAMRT_DATA_DIR/container_name.txt"`
STEAMRT_HOSTNAME=`cat "$STEAMRT_DATA_DIR/hostname.txt"`

docker run -it \
           --hostname "$STEAMRT_HOSTNAME" \
           --restart unless-stopped \
           --name "$STEAMRT_CONTAINER_NAME" \
           "$STEAMRT_IMAGE_NAME"
