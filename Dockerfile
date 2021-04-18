# Docker Container that runs the UPNP to configure the container

FROM arm32v6/alpine:3.12.4


RUN apk add --no-cache \
miniupnpc=2.1.20191224-r0
