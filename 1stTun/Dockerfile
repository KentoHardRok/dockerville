FROM alpine:latest
LABEL Tom Wilent
RUN apk update && \
    apk upgrade && \ 
    apk add \
        wireguard-tools \
        iptables \
        bash

WORKDIR /etc/wireguard

RUN 

COPY ./wg0.conf /etc/wireguard/
CMD ['wireguard']
EXPOSE 51820/udp