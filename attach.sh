#!/bin/bash

source .env

echo "Attaching to \"$STEAMOS_CONTAINER_NAME\" container"
docker container attach "$STEAMOS_CONTAINER_NAME"
