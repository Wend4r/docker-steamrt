#!/bin/bash

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

STEAMRT_SNIPER_DATA_DIR="$SCRIPT_DIR/data"
STEAMRT_SNIPER_IMAGE_NAME=`cat "$STEAMRT_SNIPER_DATA_DIR/image_name.txt"`

docker build -t "$STEAMRT_SNIPER_IMAGE_NAME" .
