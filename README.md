![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://www.linuxserver.io/) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](https://forum.linuxserver.io/index.php) or for real-time support our [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/htpcmanager

Htpcmanager, a front end for many htpc related applications. Hellowlol version.[Htpcmanager](http://htpc.io/)

## Usage

```
docker create --name=htpcmanager -v /etc/localtime:/etc/localtime:ro -v <path to data>:/config -e PGID=<gid> -e PUID=<uid> -p 8085:8085 linuxserver/htpcmanager
```

**Parameters**

* `-p 8085` - the port(s)
* `-v /etc/localtime` for timesync - *optional*
* `-v /config` - where htpcmanager should store its configuration files.
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation


It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it htpcmanager /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Setting up the application

The webui is found at port 8085.

Smartmontools has not been included, you can safely ignore the warning error in the log.

## Updates

* Upgrade to the latest version simply `docker restart htpcmanager`.
* To monitor the logs of the container in realtime `docker logs -f htpcmanager`.



## Versions

+ **19.09.2015:** Initial Release.


