#!/bin/bash

source .env

echo "Building SteamRT image"
docker build -t "$STEAMOS_IMAGE_NAME" .
echo "Done!"
