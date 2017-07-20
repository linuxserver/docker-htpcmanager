FROM lsiobase/alpine.python:3.6
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install pip pacakges
RUN \
 pip install --no-cache-dir -U \
	cherrypy && \

# install app
 git clone --depth 1 https://github.com/Hellowlol/HTPC-Manager.git /app/htpcmanager && \

# cleanup
rm -rf \
	/root/.cache \
/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8085
VOLUME /config
