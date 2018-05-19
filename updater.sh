#!/bin/bash
set -e
set -x

NPM_VERSION="$(npm view @bitwarden/cli "dist-tags".latest)"
DOCKERHUB_VERSION="$(docker run --rm shihanng/bw:latest --version)"

if [ "$NPM_VERSION" != "$DOCKERHUB_VERSION" ]
then
  sed -i "s|\(install -g @bitwarden/cli@\)[0-9\.]\+$|\1${NPM_VERSION}|" Dockerfile
  git add Dockerfile
  git commit -m "ci: bump to ${NPM_VERSION}"
  git push origin nightly
fi
