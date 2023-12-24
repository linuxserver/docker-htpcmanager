# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.19

# set version label
ARG BUILD_DATE
ARG VERSION
ARG HTPCMANAGER_COMMIT
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="notdriz"

RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache --virtual=build-dependencies \
    autoconf \
    automake \
    build-base \
    cargo \
    freetype-dev \
    jpeg-dev \
    lcms2-dev \
    libffi-dev \
    libpng-dev \
    libwebp-dev \
    libxml2-dev \
    libxslt-dev \
    linux-headers \
    openjpeg-dev \
    openssl-dev \
    python3-dev \
    tiff-dev \
    zlib-dev && \
  echo "**** install runtime packages ****" && \
  apk add --no-cache \
    git \
    python3 \
    vnstat && \
  echo "**** install app ****" && \
  mkdir -p /app/htpcmanager && \
  if [ -z ${HTPCMANAGER_COMMIT+x} ]; then \
    HTPCMANAGER_COMMIT=$(curl -sX GET https://api.github.com/repos/HTPC-Manager/HTPC-Manager/commits/master2 \
    | jq -r '. | .sha'); \
  fi && \
  curl -s -o \
    /tmp/htpc.tar.gz -L \
    "https://github.com/HTPC-Manager/HTPC-Manager/archive/${HTPCMANAGER_COMMIT}.tar.gz" && \
  tar xf \
    /tmp/htpc.tar.gz -C \
    /app/htpcmanager --strip-components=1 && \
  echo "**** install pip packages ****" && \
  sed -i -e '/psutil\|pyopenssl\|pySMART/d' /app/htpcmanager/requirements.txt && \
  python3 -m venv /lsiopy && \
  pip install -U --no-cache-dir \
    pip \
    wheel && \
  pip install --no-cache-dir --find-links https://wheel-index.linuxserver.io/alpine-3.19/ -r /app/htpcmanager/requirements.txt && \
  echo ${HTPCMANAGER_COMMIT} > /app/htpcmanager/VERSION.txt && \
  echo "**** cleanup ****" && \
  apk del --purge \
    build-dependencies && \
  rm -rf \
    $HOME/.cache \
    /tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8085
VOLUME /config
