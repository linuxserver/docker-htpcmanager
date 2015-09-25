FROM linuxserver/baseimage.python

MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>

ENV APTLIST="libfreetype6-dev \
libjpeg8-dev \
libopenjpeg-dev \
libpng-dev \
libwebp-dev \
vnstat \
zlib1g-dev"

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST -qy && \

# install pip packages
pip install pillow && \
pip install paramiko && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME /config
EXPOSE 8085

