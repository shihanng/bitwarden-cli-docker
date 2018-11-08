FROM node:10-alpine
MAINTAINER Shi Han NG "shihanng@gmail.com"

RUN npm install -g @bitwarden/cli@1.5.0

ENTRYPOINT [ "/usr/local/bin/bw" ]
