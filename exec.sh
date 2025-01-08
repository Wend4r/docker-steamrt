#!/bin/bash

source .env

if [ -z "$STEAMOS_TARGET_USERNAME" ]; then
	STEAMOS_TARGET_USERNAME="root"
fi

docker exec -u "$STEAMOS_TARGET_USERNAME" "$STEAMOS_CONTAINER_NAME" $@ && \
echo "Executed a command for \"$STEAMOS_CONTAINER_NAME\" container with \"$STEAMOS_TARGET_USERNAME\" user"
exit $?
