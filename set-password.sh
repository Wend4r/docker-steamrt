#!/bin/bash

SCRIPT_PATH="$(realpath "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
STEAMOS_DATA_DIR="$SCRIPT_DIR/data"

source .env

if [ -z "$STEAMOS_TARGET_USERNAME" ]; then
	read -s -p "Enter a username (by default, root): " STEAMOS_TARGET_USERNAME
	echo

	if [ -z "$STEAMOS_TARGET_USERNAME" ]; then
		STEAMOS_TARGET_USERNAME="root"
	fi
fi

STEAMOS_USER_PASSWORD_PATH="$STEAMOS_DATA_DIR/${STEAMOS_TARGET_USERNAME}_password.txt"
STEAMOS_USER_PASSWORD=`cat "$STEAMOS_USER_PASSWORD_PATH" 2> /dev/null`

if [ -z "$STEAMOS_USER_PASSWORD" ]; then
	read -s -p "Enter a password of \"$STEAMOS_TARGET_USERNAME\" user (by default, randomly): " STEAMOS_USER_PASSWORD
	echo

	if [ -z "$STEAMOS_USER_PASSWORD" ]; then
		STEAMOS_USER_PASSWORD=`openssl rand -base64 12 | tr -dc 'a-zA-Z0-9' | head -c 12`
		cat <<< "$STEAMOS_USER_PASSWORD" > $STEAMOS_USER_PASSWORD_PATH
	fi
fi

echo "A changed password stored in \"$STEAMOS_USER_PASSWORD_PATH\""

./exec.sh -u root "$STEAMOS_CONTAINER_NAME" usermod -p "$(echo $STEAMOS_USER_PASSWORD | openssl passwd -1 -stdin)" "$STEAMOS_TARGET_USERNAME" && \
echo "Successful!"
