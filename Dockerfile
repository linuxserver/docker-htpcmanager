FROM lsiobase/alpine.python
MAINTAINER sparklyballs

# install pip pacakges
RUN \
 pip install --no-cache-dir -U \
	cherrypy && \

# cleanup
rm -rf \
	/root/.cache \
/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8085
VOLUME /config
