#! /bin/sh

set -e
set -o pipefail

if [ ! -e "/var/run/docker.sock" ]; then
    echo "=> Cannot find docker socket(/var/run/docker.sock), please check the command!"
    exit 1
fi

if /usr/bin/docker version >/dev/null; then
    echo "Docker is running properly"
else
    echo "Cannot run Docker binary at /usr/bin/docker"
    echo "Please check if the docker binary is mounted correctly"
    exit 1
fi

echo "Docker cleanup started"

echo "Removing untagged docker images..."

UNTAGGED_IMAGES=$(/usr/bin/docker images | grep "<none>" | awk "{print \$3}")

if [[ $UNTAGGED_IMAGES ]]; then
  docker rmi -f $UNTAGGED_IMAGES
fi

echo "Removing exited/dead docker containers..."

EXITED_CONTAINERS=$(/usr/bin/docker ps -a -q -f status=exited)

if [[ $EXITED_CONTAINERS ]]; then
  docker rm -f $EXITED_CONTAINERS
fi

echo "Cleaning up unused docker volumes..."

UNUSED_VOLUMES=$(/usr/bin/docker volume ls -qf dangling=true)

if [[ $UNUSED_VOLUMES ]]; then
  docker volume rm $UNUSED_VOLUMES
fi

echo "Docker cleanup runs successfully"
