#!/bin/bash

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

STEAMRT_SNIPER_DATA_DIR="$SCRIPT_DIR/data"
STEAMRT_SNIPER_CONTAINER_NAME=`cat "$STEAMRT_SNIPER_DATA_DIR/container_name.txt"`

docker container attach "$STEAMRT_SNIPER_CONTAINER_NAME"
