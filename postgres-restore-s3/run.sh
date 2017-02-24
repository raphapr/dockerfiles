#! /bin/sh

set -e

if [ "${SCHEDULE}" = "**None**" ]; then
  sh restore.sh
else
  exec go-cron "$SCHEDULE" /bin/sh restore.sh
fi
