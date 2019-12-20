#!/bin/bash
set -e -x

# 修改verison和port创建不同的prometheus实例
VERSION=2
LOCAL_PORT=9190
SIDECAR_HTTP_PORT=19191
SIDECAR_GRPC_PORT=19090

PROM_IMAGE_NAME=prom/prometheus
THANOS_IMAGE_NAME=thanosio/thanos:v0.9.0

docker pull ${PROM_IMAGE_NAME}
docker pull ${THANOS_IMAGE_NAME}

LOCAL_CONF_PATH=/etc/prometheus${VERSION}
LOCAL_PROMETHEUS_DATA_DIR=/data/prometheus
NAME=prometheus${VERSiON}
SIDECAR_NAME=sidecar${VERSION}

CONF_PATH=/etc/prometheus

rm -rf ${LOCAL_CONF_PATH}
mkdir -p ${LOCAL_CONF_PATH}
cp ../etc/prometheus.yml ${LOCAL_CONF_PATH}
cp ../etc/business_sd_config.yml ${LOCAL_CONF_PATH}
cp ../etc/rules ${LOCAL_CONF_PATH} -r

# prometheus
docker run -d \
    --name=${NAME}\
    -p ${LOCAL_PORT}:9090 \
    -v ${LOCAL_CONF_PATH}/rules:${CONF_PATH}/rules \
    -v ${LOCAL_CONF_PATH}/prometheus.yml:${CONF_PATH}/prometheus.yml \
    -v ${LOCAL_CONF_PATH}/business_sd_config.yml:${CONF_PATH}/business_sd_config.yml \
    -v /data/prometheus:/prometheus \
    ${PROM_IMAGE_NAME}

# thanos sidecar
docker run -d \
    --name=${SIDECAR_NAME} \
    -v ${LOCAL_PROMETHEUS_DATA_DIR}:/var/prometheus \
    -p ${SIDECAR_HTTP_PORT}:19191 \
    -p ${SIDECAR_GRPC_PORT}:19090 \
    ${THANOS_IMAGE_NAME} \
    sidecar --tsdb.path=/var/prometheus --prometheus.url=http://localhost:${LOCAL_PORT} --http-address=0.0.0.0:19191 --grpc-address=0.0.0.0:19090

