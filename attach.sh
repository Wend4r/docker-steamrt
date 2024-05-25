#!/bin/sh

export STEAMRT_SNIPER_CONTAINER_NAME=steamrt-sniper

docker container attach "$STEAMRT_SNIPER_CONTAINER_NAME"
