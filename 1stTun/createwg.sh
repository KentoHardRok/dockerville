#!/bin/sh

set -euo pipefail

cd $WG_DIR

source vars


create_server() {
    umask 077
    wg genkey | tee key.priv | wg pubkey > key.pub
    sed -i s/"<SERVER PRIVATE KEY>"/$SERVER_PRIV/g wg0.conf    
}

create_client() {
    local NAME="client${1:0}"
    umask 077
    peerconf=
    wg genkey | tee $NAME.priv | wg pubkey > $NAME.pub
    cat peer_setup.conf >> wg0.conf
    sed -i s/"<CLIENT PUBLIC KEY>"/$CLIENT_PUB/g wg0.conf    
    sed -i s/"<CLIENT PRIV IP>"/$(expr 1 + $1)/g wg0.conf    
    sed -i s/"<EXT IP>"/$EXT_IP/g wgpeer0.conf    

}
create_server
for ((i=0; i <= $NUM_CLIENTS; i++)); do
    create_client $i;
    done



