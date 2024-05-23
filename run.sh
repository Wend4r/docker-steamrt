#!/bin/sh

export STEAMRT_SNIPER_CONTAINER_NAME=steamrt-sniper
export STEAMRT_SNIPER_HOSTNAME=steamrt-sniper

docker run -it --hostname "$STEAMRT_SNIPER_HOSTNAME" "$STEAMRT_SNIPER_CONTAINER_NAME"
