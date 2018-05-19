#!/bin/bash
set -e
set -x

NPM_VERSION="$(npm view @bitwarden/cli "dist-tags".latest)"
DOCKERFILE_VERSION="$(grep -oP '(?<=bitwarden/cli@)[0-9.]+' Dockerfile)"

if [ "$NPM_VERSION" != "$DOCKERFILE_VERSION" ]
then
  sed -i "s|\(install -g @bitwarden/cli@\)[0-9\.]\+$|\1${NPM_VERSION}|" Dockerfile
  git add Dockerfile
  git commit -m "ci: bump to ${NPM_VERSION}"
  git push origin nightly
fi
