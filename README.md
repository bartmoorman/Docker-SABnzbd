```
docker run \
--rm \
--detach \
--name sabnzbd \
--hostname sabnzbd \
--network backend \
--volume /mnt/sabnzbd-data:/data \
--volume sabnzbd-config:/config \
--publish 8080:8080 \
bmoorman/sabnzbd
```
