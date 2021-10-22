# Docker Container that runs the UPNP to configure the container

ARG SYSTEM_TIMEZONE=Europe/London

FROM balenalib/raspberry-pi-debian-python:buster-run-20210705

ARG SYSTEM_TIMEZONE

RUN \
    apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    TZ="$SYSTEM_TIMEZONE" \
    apt-get install -y \
    miniupnpc=2.1.20191224-r0 && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/nebra/upnp

COPY configureUpnp.py .

ENTRYPOINT ["python3", "/opt/nebra/upnp/configureUpnp.py"]
