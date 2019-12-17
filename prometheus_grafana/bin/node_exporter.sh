#!/bin/bash

docker pull prom/node-exporter

docker run -d --name=node-exporter -p 9100:9100 -v /proc:/host/proc:ro -v /sys:/host/sys:ro  -v /:/rootfs:ro --net="host" prom/node-exporter
