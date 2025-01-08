#!/bin/bash

source .env

echo "Building \"$STEAMOS_IMAGE_NAME\" image..."
docker build -t "$STEAMOS_IMAGE_NAME" .
echo "Done!"
