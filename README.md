### Build
```
docker build \
--tag sabnzbd \
https://github.com/iVirus/Docker-SABnzbd.git
```

### Run
```
docker run \
--rm \
--detach \
--name sabnzbd \
--network backend \
--volume /mnt/sabnzbd:/data \
--volume sabnzbd-config:/config \
--publish 8080:8080 \
sabnzbd
```
