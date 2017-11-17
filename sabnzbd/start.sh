#!/bin/bash
$(which sabnzbdplus) \
    --config-file /config \
    --server 0.0.0.0 \
    --browser 0 \
    --daemon
