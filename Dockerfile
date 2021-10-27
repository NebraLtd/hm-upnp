# Docker Container that runs the UPNP to configure the container

FROM balenalib/raspberry-pi-debian-python:buster-run-20211014

RUN \
    install_packages \
        miniupnpc

WORKDIR /opt/nebra/upnp

COPY configureUpnp.py .

ENTRYPOINT ["python3", "/opt/nebra/upnp/configureUpnp.py"]
