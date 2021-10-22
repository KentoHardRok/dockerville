#!/bin/bash

set -euo pipefail


create_server() {
    umask 077
    cd /etc/wireguard
    wg genkey | tee key.priv | wg pubkey > key.pub
    SERVER_PRIV=$(cat $WG_DIR/key.priv)
    SERVER_PUB=$(cat $WG_DIR/key.pub)
    sed -ei "s|<SERVER PRIVATE KEY>|$SERVER_PRIV|g" \    
        -ei "s|<PORT>|$WG_PORT|g" wg0.conf    
}


create_client() {
    local NAME="client${1:0}"
    PEERCONF="/etc/wireguard/client/$NAME.conf"
    wg genkey | tee $NAME.priv | wg pubkey > $NAME.pub
    cat peer_setup.conf >> wg0.conf
    sed -e "s|<CLIENT PUBLIC KEY>|$(cat $NAME.pub)|g" \    
        -e "s|<CLIENT PRIV IP>|$(expr 1 + $1)|g" -i wg0.conf    
    cat wgpeer.conf >> $PEERCONF
    sed -e "s|<CLIENT PRIV IP>|$(expr 1 + $1)|g" \    
        -e "s|<EXT IP>|$EXT_IP|g" \    
        -e "s|<PORT>|$WG_PORT|g" \
        -e "s|<SERVER PUBLIC KEY>|$SERVER_PUB|g" \
        -e "s|<CLIENT PRIVATE KEY>|$(cat $NAME.priv)|g" -i $PEERCONF    

}


main () {
    create_server
    for ((i=0; i <= $NUM_CLIENTS; i++)); do
        create_client $i
        done
}


main

