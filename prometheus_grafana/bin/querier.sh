#!/bin/bash
set -e -x

IMAGE_NAME=thanosio/thanos:v0.9.0

docker pull ${IMAGE_NAME}

mkdir -p /data/thanos/store
mkdir -p /data/thanos/compactor

# querier
docker run -d \
    --name querier \
    -p 19193:19193 \
    ${IMAGE_NAME} \
    query --http-address=0.0.0.0:19193 --store=39.105.157.120:19192 --query.replica-label=replica
    #query --http-address=0.0.0.0:19193 --store=localhost:19090 --store=locahost:19091 --query.replica-label=replica

