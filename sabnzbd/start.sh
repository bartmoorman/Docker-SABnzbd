#!/bin/bash
$(which sabnzbdplus) \
    --config-file /config \
    --server 0.0.0.0:${SABNZBD_PORT} \
    --browser 0 \
    --daemon
