#!/bin/bash
set -e -x

# 修改verison和port创建不同的prometheus实例
VERSION=2
LOCAL_PORT=9190

PROM_IMAGE_NAME=prom/prometheus

docker pull ${PROM_IMAGE_NAME}

LOCAL_CONF_PATH=/etc/prometheus${VERSION}
NAME=prometheus${VERSiON}

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
