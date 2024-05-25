#!/bin/bash

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

STEAMRT_DATA_DIR="$SCRIPT_DIR/data"
STEAMRT_CONTAINER_NAME=`cat "$STEAMRT_DATA_DIR/container_name.txt"`

echo "Attaching to SteamRT container"
docker container attach "$STEAMRT_CONTAINER_NAME"
