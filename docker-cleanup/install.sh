#! /bin/sh

# exit if a command fails
set -e

apk update

# set timezone
apk add -U tzdata
cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

# install docker
apk add docker

# install bash
apk add bash

# install go-cron
apk add curl
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl


# cleanup
rm -rf /var/cache/apk/*
