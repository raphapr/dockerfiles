#! /bin/sh

set -e
set -o pipefail

if [ "${S3_ACCESS_KEY_ID}" = "**None**" ]; then
  echo "You need to set the S3_ACCESS_KEY_ID environment variable."
  exit 1
fi

if [ "${S3_SECRET_ACCESS_KEY}" = "**None**" ]; then
  echo "You need to set the S3_SECRET_ACCESS_KEY environment variable."
  exit 1
fi

if [ "${S3_BUCKET}" = "**None**" ]; then
  echo "You need to set the S3_BUCKET environment variable."
  exit 1
fi

if [ "${JENKINS_HOME}" = "**None**" ]; then
  echo "You need to set the JENKINS_HOME environment variable."
  exit 1
fi

if [ ! -d "${JENKINS_HOME}" ]; then
  echo "${JENKINS_HOME} doesn't exist."
  exit 1
fi

# env vars needed for aws tools
export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$S3_REGION

echo "Compressing jenkins home..."

tar -zcvf jenkins_backup.tar.gz $JENKINS_HOME

echo "Uploading jenkins home to $S3_BUCKET"

aws s3 cp jenkins_backup.tar.gz s3://$S3_BUCKET/$(date +"%d-%m-%Y-T-%H:%M:%S").jenkins || exit 2

echo "Jenkins backup uploaded successfully"
