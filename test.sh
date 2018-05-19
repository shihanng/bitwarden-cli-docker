#!/bin/bash
set -e
set -x

TAG="shihanng/bitwarden-cli-docker:test"
DOCKERFILE_VERSION="$(grep -oP '(?<=bitwarden/cli@)[0-9.]+' Dockerfile)"


docker build -t "${TAG}" .
ACTUAL_VERSION="$(docker run --rm ${TAG} --version)"

if [ "$DOCKERFILE_VERSION" != "$ACTUAL_VERSION" ]
then
  echo "test failed"
  exit 1
fi

exit 0
