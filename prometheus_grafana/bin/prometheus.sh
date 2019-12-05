#!/bin/bash

docker pull prom/prometheus

mkdir -p /etc/prometheus
cp ../etc/prometheus.yml /etc/prometheus/
cp ../etc/business_sd_config.yml /etc/prometheus/

docker run -d --name=prometheus -p 9090:9090 -v /etc/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml -v /etc/prometheus/business_sd_config.yml:/etc/prometheus/business_sd_config.yml prom/prometheus

