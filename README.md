## Without VPN

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

## With VPN provided by Private Internet Access

### Usage
```
docker run \
--rm \
--detach \
--init \
--cap-add NET_ADMIN \
--device /dev/net/tun \
--name sabnzbd \
--hostname sabnzbd \
--volume sabnzbd-config:/config \
--volume sabnzbd-data:/data \
--publish 8080:8080 \
--dns 209.222.18.222 \
--dns 209.222.18.218 \
--env "OPENVPN_USERNAME=**username**" \
--env "OPENVPN_PASSWORD=**password**" \
bmoorman/sabnzbd:vpn
```
