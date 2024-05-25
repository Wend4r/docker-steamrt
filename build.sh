#!/bin/bash

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

STEAMRT_DATA_DIR="$SCRIPT_DIR/data"
STEAMRT_IMAGE_NAME=`cat "$STEAMRT_DATA_DIR/image_name.txt"`

docker build -t "$STEAMRT_IMAGE_NAME" .
