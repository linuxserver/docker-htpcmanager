FROM linuxserver/baseimage

MAINTAINER Sparklyballs <sparklyballs@linuxserver.io>

ENV APTLIST="--no-install-recommends \
build-essential \
git \
libfreetype6-dev \
libffi-dev \
libjpeg8-dev \
libopenjpeg-dev \
libpng-dev \
libssl-dev \
libwebp-dev \
openssl \
python2.7 \
python2.7-dev \
python-pip \
vnstat \
zlib1g-dev"

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST -qy && \

# install pip packages
pip install -U pip && \
pip install virtualenv && \
pip install Pillow && \
pip install psutil>=3.0.0 && \
pip install pyopenssl && \
pip install paramiko && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME /config
EXPOSE 8085

