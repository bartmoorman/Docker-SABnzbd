FROM bmoorman/ubuntu

ARG DEBIAN_FRONTEND="noninteractive"

RUN echo 'deb http://ppa.launchpad.net/jcfp/nobetas/ubuntu xenial main' > /etc/apt/sources.list.d/sabnzbd.list && \
    echo 'deb-src http://ppa.launchpad.net/jcfp/nobetas/ubuntu xenial main' >> /etc/apt/sources.list.d/sabnzbd.list && \
    echo 'deb http://ppa.launchpad.net/jcfp/sab-addons/ubuntu xenial main' > /etc/apt/sources.list.d/sabnzbd-addons.list && \
    echo 'deb-src http://ppa.launchpad.net/jcfp/sab-addons/ubuntu xenial main' >> /etc/apt/sources.list.d/sabnzbd-addons.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4BB9F05F && \
    apt-get update && \
    apt-get dist-upgrade --yes && \
    apt-get install --yes --no-install-recommends sabnzbdplus python-sabyenc python-cryptography par2-tbb unrar unzip p7zip-full openssh-client && \
    apt-get autoremove --yes --purge && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /data /config

CMD ["sabnzbdplus", "--config-file", "/config" ,"--server" ,"0.0.0.0" ,"--browser" ,"0"]

EXPOSE 8080
