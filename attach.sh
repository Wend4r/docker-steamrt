#!/bin/bash

source .env

echo "Attaching to SteamRT container"
docker container attach "$STEAMRT_CONTAINER_NAME"
