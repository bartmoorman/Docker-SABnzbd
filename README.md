```
docker run \
--rm \
--detach \
--init \
--name sabnzbd \
--hostname sabnzbd \
--volume sabnzbd-data:/data \
--volume sabnzbd-config:/config \
--publish 8080:8080 \
bmoorman/sabnzbd
```
