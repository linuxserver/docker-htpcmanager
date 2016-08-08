![https://linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io](https://forum.linuxserver.io)
* [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`
* [Podcast](https://www.linuxserver.io/index.php/category/podcast/) covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/htpcmanager

Htpcmanager, a front end for many htpc related applications. Hellowlol version.[Htpcmanager](http://htpc.io/)

## Usage

```
docker create --name=htpcmanager \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 8085:8085 \
linuxserver/htpcmanager
```

**Parameters**

* `-p 8085` - the port(s)
* `-v /config` - where htpcmanager should store its configuration files.
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine-linux with s6 overlay, for shell access whilst the container is running do `docker exec -it htpcmanager /bin/bash`.


### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

The webui is found at port 8085.

Smartmontools has not been included, you can safely ignore the warning error in the log.

## Info

* To monitor the logs of the container in realtime `docker logs -f htpcmanager`.



## Versions
+ **08.08.16:** Rebase to alpine linux.
+ **14.01.15:** Remove hardcoded loglevel from the run command, set in webui
+ **19.09.15:** Initial Release.


