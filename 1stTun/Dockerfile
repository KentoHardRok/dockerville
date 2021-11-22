FROM alpine:latest
LABEL Tom Wilent
RUN apk update && \
    apk add \
        wireguard-tools \
        iptables \
        bash
ENV WG_PORT=51820
ENV NUM_CLIENTS=5
ENV PRIV_NET=10.0.0.
ENV EXT_IP=172.16.0.10
WORKDIR /etc/wireguard
COPY wg0.conf wgpeer.conf peer_setup.conf ./
COPY createwg /usr/local/bin/
RUN chmod +x /usr/local/bin/createwg && \
    mkdir client
ENTRYPOINT createwg && bash