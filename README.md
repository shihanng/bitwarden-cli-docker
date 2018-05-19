Dockerized https://github.com/bitwarden/cli.

[![CircleCI](https://img.shields.io/circleci/project/github/shihanng/bitwarden-cli-docker.svg)](https://circleci.com/gh/shihanng/bitwarden-cli-docker/tree/master)
[![CircleCI branch](https://img.shields.io/circleci/project/github/shihanng/bitwarden-cli-docker/nightly.svg)](https://circleci.com/gh/shihanng/bitwarden-cli-docker/tree/nightly)
[![Docker Automated build](https://img.shields.io/docker/automated/shihanng/bitwarden-cli-docker.svg)](https://hub.docker.com/r/shihanng/bitwarden-cli-docker/)
[![Docker Build Status](https://img.shields.io/docker/build/shihanng/bitwarden-cli-docker.svg)](https://hub.docker.com/r/shihanng/bitwarden-cli-docker/)

## Usage

Clone and build your own,

    $ git clone git@github.com:shihanng/bitwarden-cli-docker.git
    $ docker build -t <IMAGE_NAME> .

Or pull from https://hub.docker.com/r/shihanng/bitwarden-cli-docker/

    $ docker pull shihanng/bitwarden-cli-docker:latest

The content in `/root/.config/Bitwarden CLI` has to be persistence so that we
do not have to login everytime. This can be achieved with:

    $ docker run -it --rm -v <SOME_SAFE_PLACE_ON_HOST>:"/root/.config/Bitwarden CLI" shihanng/bitwarden-cli-docker:latest login
    Email address: user@example.com
    Master password: ****************
    Two-step login code for Authenticator App: 123456
    You are logged in!
    
    To unlock your vault, set your session key to the `BW_SESSION` environment variable. ex:
    $ export BW_SESSION="xxxxxxx"
    > $env:BW_SESSION="xxxxxxx"
    
    You can also pass the session key to any command with the `--session` option. ex:
    $ bw get items --session xxxxxxx%
    
The environment variable `BW_SESSION` has to be passed into the container to retrieve secret from Bitwarden:

    $ export BW_SESSION="xxxxxxx"
    $ docker run --rm -v <SOME_SAFE_PLACE_ON_HOST>:"/root/.config/Bitwarden CLI" -e BW_SESSION shihanng/bitwarden-cli-docker:latest get password google.com
