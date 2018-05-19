#!/bin/bash
set -e
set -x

NPM_VERSION="$(npm view @bitwarden/cli "dist-tags".latest)"
DOCKERHUB_VERSION="$(docker run --rm shihanng/bw:latest --version)"

if [ "$NPM_VERSION" != "$DOCKERHUB_VERSION" ]
then
  sed "s|\(install -g @bitwarden/cli@\)[0-9\.]\+$|\1${NPM_VERSION}|" Dockerfile
  git remote -vv
  git add Dockerfile
  git commit -m "ci: bump to ${NPM_VERSION}"
fi
