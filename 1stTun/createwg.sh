#!/bin/bash

set -euo pipefail


create_server() {
    umask 077
    cd /etc/wireguard
    wg genkey | tee key.priv | wg pubkey > key.pub
    source vars
    sed -i "s|<SERVER PRIVATE KEY>|$SERVER_PRIV|g" wg0.conf    
    sed -i "s|<PORT>|$WG_PORT|g" wg0.conf    
}


create_client() {
    local NAME="client${1:0}"
    PEERCONF="$NAME.conf"
    wg genkey | tee $NAME.priv | wg pubkey > $NAME.pub
    cat peer_setup.conf >> wg0.conf
    sed -i "s|<CLIENT PUBLIC KEY>|$(cat $NAME.pub)|g" wg0.conf    
    sed -i "s|<CLIENT PRIV IP>|$(expr 1 + $1)|g" wg0.conf    
    cat wgpeer.conf >> $PEERCONF
    sed -i "s|<CLIENT PRIV IP>|$(expr 1 + $1)|g" $PEERCONF    
    sed -i "s|<EXT IP>|$EXT_IP|g" $PEERCONF    
    sed -i "s|<PORT>|$WG_PORT|g" $PEERCONF
    sed -i "s|<SERVER PUBLIC KEY>|$SERVER_PUB|g" $PEERCONF
    sed -i "s|<CLIENT PRIVATE KEY>|$(cat $NAME.priv)|g" $PEERCONF    

}


main () {
    create_server
    for ((i=0; i <= $NUM_CLIENTS; i++)); do
        create_client $i
        done
}


main

