FROM node:10-alpine
MAINTAINER Shi Han NG "shihanng@gmail.com"

RUN npm install -g @bitwarden/cli@1.7.1

ENTRYPOINT [ "/usr/local/bin/bw" ]
