#!/bin/bash

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

STEAMRT_DATA_DIR="$SCRIPT_DIR/data"
STEAMRT_CONTAINER_NAME=`cat "$STEAMRT_DATA_DIR/container_name.txt"`

if [ -z "$STEAMRT_TARGET_USERNAME" ]; then
	read -s -p "Enter username (by default, root): " STEAMRT_TARGET_USERNAME
	echo

	if [ -z "$STEAMRT_TARGET_USERNAME" ]; then
		STEAMRT_TARGET_USERNAME="root"
	fi
fi

STEAMRT_USER_PASSWORD_PATH="$STEAMRT_DATA_DIR/${STEAMRT_TARGET_USERNAME}_password.txt"
STEAMRT_USER_PASSWORD=`cat "$STEAMRT_USER_PASSWORD_PATH" 2> /dev/null`

if [ -z "$STEAMRT_USER_PASSWORD" ]; then
	read -s -p "Enter $STEAMRT_TARGET_USERNAME password (by default, randomly): " STEAMRT_USER_PASSWORD
	echo

	if [ -z "$STEAMRT_USER_PASSWORD" ]; then
		STEAMRT_USER_PASSWORD=`openssl rand -base64 12 | tr -dc 'a-zA-Z0-9' | head -c 12`
		cat <<< "$STEAMRT_USER_PASSWORD" > $STEAMRT_USER_PASSWORD_PATH
	fi
fi

echo "Password stored in \"$STEAMRT_USER_PASSWORD_PATH\""

docker exec -u root "$STEAMRT_CONTAINER_NAME" usermod -p "$(echo $STEAMRT_USER_PASSWORD | openssl passwd -1 -stdin)" $STEAMRT_TARGET_USERNAME && \
echo "Successful!"
