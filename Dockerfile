# Docker Container that runs the UPNP to configure the container

ARG SYSTEM_TIMEZONE=Europe/London

FROM balenalib/raspberry-pi-debian-python:buster-run-20211014

ARG SYSTEM_TIMEZONE

# hadolint ignore=DL3008
RUN \
    apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    TZ="$SYSTEM_TIMEZONE" \
      apt-get install -y \
        miniupnpc \
        --no-install-recommends && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/nebra/upnp

COPY configureUpnp.py .

ENTRYPOINT ["python3", "/opt/nebra/upnp/configureUpnp.py"]
