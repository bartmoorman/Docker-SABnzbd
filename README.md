## Without VPN

### Docker Run
```
docker run \
--detach \
--name sabnzbd \
--restart unless-stopped \
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
    restart: unless-stopped
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
--restart unless-stopped \
--dns 1.1.1.1 \
--dns 1.0.0.1 \
--cap-add NET_ADMIN \
--device /dev/net/tun \
--publish 8080:8080 \
--env "PIA_USER=**username**" \
--env "PIA_PASS=**password**" \
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
    restart: unless-stopped
    dns:
      - 1.1.1.1
      - 1.0.0.1
    cap_add:
      - NET_ADMIN
    devices:
      - "/dev/net/tun"
    ports:
      - "8080:8080"
    environment:
      - PIA_USER=**username**
      - PIA_PASS=**password**
    volumes:
      - sabnzbd-config:/config
      - sabnzbd-data:/data

volumes:
  sabnzbd-config:
  sabnzbd-data:
```

### Environment Variables
|Variable|Description|Default|
|--------|-----------|-------|
|TZ|Sets the timezone|`America/Denver`|
|PIA_USER|PIA username|`<empty>`|
|PIA_PASS|PIA password|`<empty>`|
