#!/bin/bash

## start php-fpm
/opt/apps/php/sbin/php-fpm -y /opt/apps/php/etc/php-fpm.conf 

## start php-fpm-exporter
nohup /opt/apps/php-fpm-exporter/php-fpm-exporter -addr 0.0.0.0:8085 -status-url http://127.0.0.1/status > /data/logs/app/php-fpm-exporter.log 2>&1 &

## start nginx
nginx -t && nginx -g "daemon off;"
