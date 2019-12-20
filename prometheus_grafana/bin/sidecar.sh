#!/bin/bash
set -e -x

# 修改verison和port创建不同的prometheus实例
VERSION=2
LOCAL_PORT=9190
SIDECAR_HTTP_PORT=19192
SIDECAR_GRPC_PORT=19091
LOCAL_PROMETHEUS_DATA_DIR=/data/prometheus

IMAGE_NAME=thanosio/thanos:v0.9.0

docker pull ${IMAGE_NAME}

SIDECAR_NAME=sidecar${VERSION}


# thanos sidecar
docker run -d \
    --name=${SIDECAR_NAME} \
    -v ${LOCAL_PROMETHEUS_DATA_DIR}:/var/prometheus \
    -p ${SIDECAR_HTTP_PORT}:19191 \
    -p ${SIDECAR_GRPC_PORT}:19090 \
    ${IMAGE_NAME} \
    sidecar --tsdb.path=/var/prometheus --prometheus.url=http://39.105.157.120:${LOCAL_PORT} --http-address=0.0.0.0:19191 --grpc-address=0.0.0.0:19090

