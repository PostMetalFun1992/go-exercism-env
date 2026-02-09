#!/bin/bash

set -e

IMAGE_NAME="${1:-go-exercism-env}"

USER_ID=$(id -u)
GROUP_ID=$(id -g)

docker build \
  -f ./Dockerfile \
  --build-arg USER_ID="$USER_ID" \
  --build-arg GROUP_ID="$GROUP_ID" \
  -t "$IMAGE_NAME" .
