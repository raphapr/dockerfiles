FROM alpine:3.5
MAINTAINER Raphael P. Ribeiro "raphaelpr01@gmail.com"
#MAINTAINER Johannes Schickling "schickling.j@gmail.com"

ADD install.sh install.sh
RUN sh install.sh && rm install.sh

ENV PATH_TO_BACKUP **None**
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_PATH 'backup'
ENV SCHEDULE **None**

ADD run.sh run.sh
ADD backup.sh backup.sh

CMD ["sh", "run.sh"]
