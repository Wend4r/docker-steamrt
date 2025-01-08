#!/bin/bash

source .env

if [ -z "$STEAMOS_TARGET_USERNAME" ]; then
	read -s -p "Enter username (by default, root): " STEAMOS_TARGET_USERNAME
	echo

	if [ -z "$STEAMOS_TARGET_USERNAME" ]; then
		STEAMOS_TARGET_USERNAME="root"
	fi
fi

STEAMOS_USER_PASSWORD_PATH="$STEAMOS_DATA_DIR/${STEAMOS_TARGET_USERNAME}_password.txt"
STEAMOS_USER_PASSWORD=`cat "$STEAMOS_USER_PASSWORD_PATH" 2> /dev/null`

if [ -z "$STEAMOS_USER_PASSWORD" ]; then
	read -s -p "Enter $STEAMOS_TARGET_USERNAME password (by default, randomly): " STEAMOS_USER_PASSWORD
	echo

	if [ -z "$STEAMOS_USER_PASSWORD" ]; then
		STEAMOS_USER_PASSWORD=`openssl rand -base64 12 | tr -dc 'a-zA-Z0-9' | head -c 12`
		cat <<< "$STEAMOS_USER_PASSWORD" > $STEAMOS_USER_PASSWORD_PATH
	fi
fi

echo "Password stored in \"$STEAMOS_USER_PASSWORD_PATH\""

docker exec -u root "$STEAMOS_CONTAINER_NAME" usermod -p "$(echo $STEAMOS_USER_PASSWORD | openssl passwd -1 -stdin)" $STEAMOS_TARGET_USERNAME && \
echo "Successful!"
