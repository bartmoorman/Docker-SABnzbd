```
docker run \
--rm \
--detach \
--init \
--name sabnzbd \
--network backend \
--volume /mnt/sabnzbd-data:/data \
--volume sabnzbd-config:/config \
--publish 8080:8080 \
bmoorman/sabnzbd
```
