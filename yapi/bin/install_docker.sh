#!/bin/bash

docker pull mrjin/yapi:latest

docker pull mongo

docker network create back-net

cd ../etc

docker-compose up -d

#默认密码：ymfe.org 账号：me@jinfeijie.cn  

