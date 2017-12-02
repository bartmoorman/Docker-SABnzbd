### Usage
```
docker run \
--rm \
--detach \
--init \
--name sabnzbd \
--hostname sabnzbd \
--volume sabnzbd-config:/config \
--volume sabnzbd-data:/data \
--publish 8080:8080 \
bmoorman/sabnzbd
```
