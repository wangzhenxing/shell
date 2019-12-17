#!/bin/bash
set -e -x

docker pull prom/prometheus
docker pull prom/alertmanager

LOCAL_PORT=9190
LOCAL_CONF_PATH=/etc/prometheus2
NAME=prometheus2

CONF_PATH=/etc/prometheus
IMAGE_NAME=prom/prometheus

rm -rf ${LOCAL_CONF_PATH}
mkdir -p ${LOCAL_CONF_PATH}
cp ../etc/prometheus.yml ${LOCAL_CONF_PATH}
cp ../etc/business_sd_config.yml ${LOCAL_CONF_PATH}
cp ../etc/rules ${LOCAL_CONF_PATH} -r

# prometheus
docker run -d --name=${NAME} -p ${LOCAL_PORT}:9090 -v ${LOCAL_CONF_PATH}/rules:${CONF_PATH}/rules -v ${LOCAL_CONF_PATH}/prometheus.yml:${CONF_PATH}/prometheus.yml -v ${LOCAL_CONF_PATH}/business_sd_config.yml:${CONF_PATH}/business_sd_config.yml -v /data/prometheus:/prometheus ${IMAGE_NAME}
