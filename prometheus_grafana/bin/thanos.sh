#!/bin/bash
set -e -x

IMAGE_NAME=thanosio/thanos:v0.9.0

docker pull ${IMAGE_NAME}

mkdir -p /data/thanos/store
mkdir -p /data/thanos/compactor

# storer
docker run -d \
    --name storer \
    -v /data/thanos/store:/var/thanos/store \
    ${IMAGE_NAME} \
    store --data-dir=/var/thanos/store --http-address=0.0.0.0:19191 --grpc-address=0.0.0.0:19090

# compactor
docker run -d \
    --name compactor \
    -v /data/thanos/compact:/var/thanos/compact \
    ${IMAGE_NAME} \
    compact --data-dir=/var/thanos/compact --http-address=0.0.0.0:19191 --wait

# querier
docker run -d \
    --name querier \
    -p 19192:19192 \
    ${IMAGE_NAME} \
    #query --http-address=0.0.0.0:19192 --store=localhost:19090 --store=locahost:19091 --store=storer:19090 --query.replica-label=replica
    query --http-address=0.0.0.0:19192 --store=localhost:19090 --store=locahost:19091 --query.replica-label=replica

