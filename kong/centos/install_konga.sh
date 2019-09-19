#!/bin/bash
set -e
set -x

_pullKonga() {
    docker pull pantsel/konga
}

_createNetwork() {
    #docker network rm kong-network
    docker network create kong-network
}

_startKonga() {
#docker rm konga
# DB_HOST不能用localhost，创建mongo的时候bindip用本机内网ip
# DB_HOST用内网ip，不能用localhost
docker run -p 1337:1337 \
    --network kong-network \
    --name konga \
    -e "NODE_ENV=production" \
    -e "TOKEN_SECRET=KongSecret" \
    -e "DB_ADAPTER=mongo" \
    -e "DB_HOST=172.25.20.169" \
    -e "DB_PORT=27017" \
    -e "DB_USER=admin" \
    -e "DB_DATABASE=konga" \
    pantsel/konga
}
#    -e "DB_PASSWORD=123456" \

##### main logic #####
#_pullKonga
#_createNetwork
_startKonga
