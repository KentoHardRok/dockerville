FROM alpine:latest
LABEL Tom Wilent
RUN apk update && \
    apk upgrade && \ 
    apk add wireguard-tools iptables

WORKDIR /etc/wireguard

COPY ./wg0.conf /etc/wireguard/
CMD ['wireguard']
EXPOSE 51820/udp