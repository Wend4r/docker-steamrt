#!/bin/bash

source .env

echo "Attaching to SteamRT container"
docker container attach "$STEAMOS_CONTAINER_NAME"
