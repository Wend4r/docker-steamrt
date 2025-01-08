#!/bin/bash

source .env

docker exec -it "$STEAMOS_CONTAINER_NAME" $@
echo "Executed a command for \"$STEAMOS_CONTAINER_NAME\" container"
