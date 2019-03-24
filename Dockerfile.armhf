FROM lsiobase/python:arm32v7-3.9

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="sparklyballs"

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
        jq && \
 echo "**** install pip packages ****" && \
 pip install --no-cache-dir -U \
	cherrypy && \
 echo "**** install app ****" && \
 git clone --depth 1 https://github.com/Hellowlol/HTPC-Manager.git /app/htpcmanager && \
 echo "**** cleanup ****" && \
 rm -rf \
	/root/.cache \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8085
VOLUME /config
