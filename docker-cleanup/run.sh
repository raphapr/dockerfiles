#! /bin/sh

set -e

if [ "${SCHEDULE}" = "**None**" ]; then
  bash cleanup.sh
else
  exec go-cron "$SCHEDULE" /bin/sh cleanup.sh
fi
