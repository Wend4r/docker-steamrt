#!/bin/bash

source .env

echo "Building SteamRT image"
docker build -t "$STEAMRT_IMAGE_NAME" .
echo "Done!"
