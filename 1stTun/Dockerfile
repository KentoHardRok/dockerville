FROM alpine:latest
LABEL Tom Wilent
RUN apk update && \
    apk upgrade && \ 
    apk add \
        wireguard-tools \
        iptables \
        bash

WORKDIR /etc/wireguard
COPY wg0.conf wgpeer.conf peer_setup.conf .
COPY createwg.sh /usr/local/bin
RUN chmod +x /usr/local/bin/createwg.sh
RUN mkdir client
RUN /usr/local/bin/createwg.sh
EXPOSE 51820/udp
ENTRYPOINT ['wg-quick', 'up', 'wg0']