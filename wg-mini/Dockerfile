FROM alpine
RUN apk add wireguard-tools
WORKDIR /etc/wireguard
RUN wg genkey | tee serv.priv | wg pubkey > serv.pub
COPY ./wg0.conf /etc/wireguard/
COPY ./client_create.sh /etc/wireguard/
COPY ./client_base.conf
EXPOSE 51820/udp


