## Without VPN

### Usage
```
docker run \
--detach \
--name sabnzbd \
--publish 8080:8080 \
--volume sabnzbd-config:/config \
--volume sabnzbd-data:/data \
bmoorman/sabnzbd:latest
```

## With VPN provided by Private Internet Access

### Usage
```
docker run \
--detach \
--name sabnzbd \
--dns 209.222.18.222 \
--dns 209.222.18.218 \
--cap-add NET_ADMIN \
--device /dev/net/tun \
--publish 8080:8080 \
--env "OPENVPN_USERNAME=**username**" \
--env "OPENVPN_PASSWORD=**password**" \
--volume sabnzbd-config:/config \
--volume sabnzbd-data:/data \
bmoorman/sabnzbd:vpn
```
