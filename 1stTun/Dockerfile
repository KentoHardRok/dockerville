FROM alpine:latest
LABEL Tom Wilent
RUN apk update && \
    apk upgrade && \ 
    apk add \
        wireguard-tools \
        iptables \
        bash
ENV WG_PORT=1194
ENV NUM_CLIENTS=10
ENV PRIV_NET=10.0.0.
ENV EXT_IP=172.16.1.100
WORKDIR /etc/wireguard
COPY wg0.conf wgpeer.conf peer_setup.conf ./
COPY createwg.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/createwg.sh
RUN mkdir client
RUN /usr/local/bin/createwg.sh
EXPOSE $WG_PORT/udp
CMD ['wg-quick', 'up', 'wg0']