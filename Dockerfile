# Docker Container that runs the UPNP to configure the container

FROM balenalib/genericx86-64-ext-alpine:3.12.4

RUN apk add --no-cache \
    miniupnpc=2.1.20191224-r0 \
    python3=3.8.10-r0

WORKDIR /opt/nebra/upnp

COPY configureUpnp.py .

ENTRYPOINT ["python3", "/opt/nebra/upnp/configureUpnp.py"]
