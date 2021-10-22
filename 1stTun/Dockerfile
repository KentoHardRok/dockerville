FROM alpine:latest
LABEL Tom Wilent
RUN apk update && \
    apk upgrade && \ 
    apk add \
        wireguard-tools \
        iptables \
        bash

ENV WG_DIR=/etc/wireguard
ENV WG_PORT=51820
ENV NUM_CLIENTS=1
ENV EXT_IP=192.168.1.1
WORKDIR /etc/wireguard
COPY createwg.sh wg0.conf wgpeer.conf peer_setup.conf .
RUN chmod +x createwg.sh
RUN mkdir client
RUN createwg.sh
EXPOSE 51820/udp
ENTRYPOINT ['wg-quick', 'up', 'wg0']