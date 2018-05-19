Dockerized https://github.com/bitwarden/cli.

[![CircleCI](https://circleci.com/gh/shihanng/bitwarden-cli-docker/tree/master.svg?style=shield)](https://circleci.com/gh/shihanng/bitwarden-cli-docker/tree/master)

## Usage

Clone and build your own,

    $ git clone git@github.com:shihanng/bitwarden-cli-docker.git
    $ docker build -t bw .

Or pull from https://hub.docker.com/r/shihanng/bw/

    $ docker pull shihanng/bw:latest

The content in `/root/.config/Bitwarden CLI` has to be persistence so that we
do not have to login everytime. This can be achieved with:

    $ docker run -it --rm -v <SOME SAFE PLACE ON HOST>:"/root/.config/Bitwarden CLI" shihanng/bw:latest login --raw
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
    $ docker run -it --rm -v <SOME SAFE PLACE ON HOST>:"/root/.config/Bitwarden CLI" -e BW_SESSION shihanng/bw:latest get password google.com
