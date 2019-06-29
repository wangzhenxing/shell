#!/bin/bash

docker pull mrjin/yapi:latest

docker pull mongo

docker network create back-net

cd ../etc

docker-compose up -d
