FROM jenkins:2.32.2
MAINTAINER Raphael P. Ribeiro

USER root
RUN apt-get update \
    && apt-get install -y curl git build-essential libmysqlclient-dev libxml2-dev sudo \
    gawk libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf \
    libgmp-dev libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev \
    imagemagick libqt4-dev libqtwebkit-dev xvfb libfontconfig-dev libjpeg-dev

# ruby gems dependencies
RUN apt-get install -y libpq-dev libqt4-dev postgresql

# java building
RUN apt-get install -y maven

# docker inside docker
RUN groupadd -g 118 docker
RUN usermod -a -G docker jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
  && \curl -sSL https://get.rvm.io | bash -s -- --autolibs=enable --ruby=2.2.5 --gems=bundler
RUN adduser jenkins rvm

RUN echo "source /usr/local/rvm/scripts/rvm" >> /var/jenkins_home/.bashrc

USER jenkins
