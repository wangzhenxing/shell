#!/bin/bash
set -e -x

install() {
    yum install nfs-utils -y
}

autoRestart() {
    sudo systemctl enable rpcbind
    sudo systemctl enable nfs
}

dostart() {
    sudo systemctl start rpcbind
    sudo systemctl start nfs
    #sudo firewall-cmd --zone=public --permanent --add-service={rpc-bind,mountd,nfs}
    #sudo firewall-cmd --reload
}

config() {
    echo '/root/data/nfs/jenkins 172.17.0.0/24(rw,sync,no_root_squash,no_all_squash)' >> /etc/exports
    systemctl restart nfs
}

##### main logic #####

install
autoRestart
dostart
config
