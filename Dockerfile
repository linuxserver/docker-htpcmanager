FROM lsiobase/alpine:3.12

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="notdriz"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	autoconf \
	automake \
	freetype-dev \
	g++ \
	gcc \
	jpeg-dev \
	lcms2-dev \
	libffi-dev \
	libpng-dev \
	libwebp-dev \
	libxml2-dev \
	libxslt-dev \
	linux-headers \
	make \
	openjpeg-dev \
	openssl-dev \
	python3-dev \
	tiff-dev \
	zlib-dev && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	python3 \
	py3-pip \
	git \
	vnstat \
	jq && \
 echo "**** install app ****" && \
 git clone --depth 1 https://github.com/HTPC-Manager/HTPC-Manager.git /app/htpcmanager && \
 echo "**** install pip packages ****" && \
 sed -i -e '/psutil\|pyopenssl\|pySMART/d' /app/htpcmanager/requirements.txt && \
 pip install --no-cache-dir -U -r /app/htpcmanager/requirements.txt && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \ 
 rm -rf \
	/root/.cache \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8085
VOLUME /config
