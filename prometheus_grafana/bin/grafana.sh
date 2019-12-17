#!/bin/bash

docker pull grafana/grafana

docker run -d -p 3000:3000 --name=grafana -v /data/ops/grafana-storage:/var/lib/grafana grafana/grafana
