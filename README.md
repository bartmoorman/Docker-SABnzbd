## Without VPN

### Docker Run
```
docker run \
--detach \
--name sabnzbd \
--publish 8080:8080 \
--volume sabnzbd-config:/config \
--volume sabnzbd-data:/data \
bmoorman/sabnzbd:latest
```

### Docker Compose
```
version: "3.7"
services:
  sabnzbd:
    image: bmoorman/sabnzbd:latest
    container_name: sabnzbd
    ports:
      - "8080:8080"
    volumes:
      - sabnzbd-config:/config
      - sabnzbd-data:/data

volumes:
  sabnzbd-config:
  sabnzbd-data:
```

## With VPN provided by Private Internet Access

### Docker Run
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

### Docker Compose
```
version: "3.7"
services:
  sabnzbd:
    image: bmoorman/sabnzbd:vpn
    container_name: sabnzbd
    dns:
      - 209.222.18.222
      - 209.222.18.218
    cap_add:
      - NET_ADMIN
    devices:
      - "/dev/net/tun"
    ports:
      - "8080:8080"
    environment:
      - OPENVPN_USERNAME=**username**
      - OPENVPN_PASSWORD=**password**
    volumes:
      - sabnzbd-config:/config
      - sabnzbd-data:/data

volumes:
  sabnzbd-config:
  sabnzbd-data:
```
