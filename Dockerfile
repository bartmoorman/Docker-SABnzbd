FROM bmoorman/ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive \
    TARGETPLATFORM

ENV PIA_USER="**username**" \
    PIA_PASS="**password**" \
    LOCAL_NETWORK="192.168.0.0/16" \
    SABNZBD_PORT=8080

WORKDIR /etc/openvpn

RUN echo 'deb http://ppa.launchpad.net/jcfp/nobetas/ubuntu bionic main' > /etc/apt/sources.list.d/sabnzbd.list \
 && echo 'deb-src http://ppa.launchpad.net/jcfp/nobetas/ubuntu bionic main' >> /etc/apt/sources.list.d/sabnzbd.list \
 && echo 'deb http://ppa.launchpad.net/jcfp/sab-addons/ubuntu bionic main' >> /etc/apt/sources.list.d/sabnzbd.list \
 && echo 'deb-src http://ppa.launchpad.net/jcfp/sab-addons/ubuntu bionic main' >> /etc/apt/sources.list.d/sabnzbd.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F13930B14BB9F05F \
 && echo 'deb https://packagecloud.io/ookla/speedtest-cli/ubuntu/ bionic main' > /etc/apt/sources.list.d/ookla_speedtest-cli.list \
 && echo 'deb-src https://packagecloud.io/ookla/speedtest-cli/ubuntu/ bionic main' >> /etc/apt/sources.list.d/ookla_speedtest-cli.list \
 && curl --silent --location "https://packagecloud.io/ookla/speedtest-cli/gpgkey" | apt-key add \
 && apt-get update \
 && apt-get install --yes --no-install-recommends \
    openssh-client \
    openvpn \
    p7zip-full \
    par2-tbb \
    python3-cryptography \
    python3-sabyenc \
    sabnzbdplus \
    speedtest \
    unrar \
    unzip \
    wget \
 && wget --quiet --directory-prefix /usr/local/share/ca-certificates "https://raw.githubusercontent.com/pia-foss/manual-connections/master/ca.rsa.4096.crt" \
 && update-ca-certificates \
 && wget --quiet --directory-prefix /etc/openvpn "https://www.privateinternetaccess.com/openvpn/openvpn.zip" \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ${TARGETPLATFORM}/netselect /usr/local/bin/
COPY openvpn/ /etc/openvpn/
COPY sabnzbd/ /etc/sabnzbd/

VOLUME /config /data

EXPOSE ${SABNZBD_PORT}

CMD ["/etc/openvpn/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --head --insecure --silent --show-error --fail "http://localhost:${SABNZBD_PORT}/" || exit 1
