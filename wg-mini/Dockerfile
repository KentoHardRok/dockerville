FROM python:3.9-alpine
LABEL Tom Wilent
RUN pip install jinja2 netifaces
RUN apk add wireguard-tools iptables python3 py3-pip
WORKDIR /etc/wireguard
RUN wg genkey | tee serv.priv | wg pubkey > serv.pub

ENV CLIENT_COUNT 1
ENV CLIENT_NAME client
ENV HOST_EXT_IP 

COPY ./wg0.conf /etc/wireguard/
COPY ./client_create.sh /etc/wireguard/
COPY ./client_base.conf
COPY iptables_ipv4 /etc/
EXPOSE 51820/udp
