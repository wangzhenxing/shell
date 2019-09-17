#!/bin/bash
docker pull pantsel/konga

docker network create kong-network

docker run -p 1337:1337 \
    --network kong-network \
    --name konga-new \
    -e "NODE_ENV=production" \
    -e "TOKEN_SECRET=KongSecret" \
    pantsel/konga
