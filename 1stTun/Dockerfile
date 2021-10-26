FROM alpine:latest
LABEL Tom Wilent
RUN apk update && \
    apk upgrade && \ 
    apk add \
        wireguard-tools \
        iptables \
        bash
ARG BT_WG_PORT=1194
ENV WG_PORT=${BT_WG_PORT}
ARG BT_NUM_CLIENTS=10
ENV NUM_CLIENTS=${BT_NUM_CLIENTS}
ARG BT_PRIV_NET=10.0.0. 
ENV PRIV_NET=${BT_PRIV_NET}
ARG BT_EXT_IP=172.16.1.100
ENV EXT_IP=${BT_EXT_IP}
WORKDIR /etc/wireguard
COPY wg0.conf wgpeer.conf peer_setup.conf ./
COPY createwg.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/createwg.sh
RUN mkdir client
RUN /usr/local/bin/createwg.sh
EXPOSE $WG_PORT/udp
CMD ['wg-quick', 'up', 'wg0']