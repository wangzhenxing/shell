#!/bin/bash
set -e -x

docker pull prom/alertmanager

DOCKER_CONF_DIR=/etc/alertmanager
LOCAL_CONF_DIR=/etc/prometheus
IMAGE_NAME=prom/alertmanager

mkdir -p /etc/prometheus
cp ../etc/alert_manager.yml ${LOCAL_CONF_DIR} 
cp ../etc/template ${LOCAL_CONF_DIR} -rf

docker run -d --name=alertmanager -p 9093:9093 -v ${LOCAL_CONF_DIR}/template:${DOCKER_CONF_DIR}/template -v ${LOCAL_CONF_DIR}/alert_manager.yml:${DOCKER_CONF_DIR}/alertmanager.yml ${IMAGE_NAME}
