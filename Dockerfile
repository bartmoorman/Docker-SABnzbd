FROM bmoorman/ubuntu:xenial

ENV SABNZBD_PORT="8080"

ARG DEBIAN_FRONTEND="noninteractive"

RUN echo 'deb http://ppa.launchpad.net/jcfp/nobetas/ubuntu xenial main' > /etc/apt/sources.list.d/sabnzbd.list \
 && echo 'deb-src http://ppa.launchpad.net/jcfp/nobetas/ubuntu xenial main' >> /etc/apt/sources.list.d/sabnzbd.list \
 && echo 'deb http://ppa.launchpad.net/jcfp/sab-addons/ubuntu xenial main' > /etc/apt/sources.list.d/sabnzbd-addons.list \
 && echo 'deb-src http://ppa.launchpad.net/jcfp/sab-addons/ubuntu xenial main' >> /etc/apt/sources.list.d/sabnzbd-addons.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4BB9F05F \
 && apt-get update \
 && apt-get install --yes --no-install-recommends \
    curl \
    openssh-client \
    p7zip-full \
    par2-tbb \
    python-cryptography \
    python-sabyenc \
    sabnzbdplus \
    unrar \
    unzip \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY sabnzbd/ /etc/sabnzbd/

VOLUME /config /data

EXPOSE ${SABNZBD_PORT}

CMD ["/etc/sabnzbd/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --head --insecure --silent --show-error --fail "http://localhost:${SABNZBD_PORT}/" || exit 1
