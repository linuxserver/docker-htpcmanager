FROM lsiobase/alpine.python
MAINTAINER sparklyballs

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8085
VOLUME /config
