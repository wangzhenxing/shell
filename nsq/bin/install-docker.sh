#!/bin/bash

docker pull nsqio/nsq

docker run -d --name lookupd -p 4160:4160 -p 4161:4161 nsqio/nsq /nsqlookupd

docker run -d --name nsqd -p 4150:4150 -p 4151:4151 nsqio/nsq /nsqd --broadcase-address=172.16.0.145 --lookupd-tcp-address=172.16.0.145:4160

docker run -d --name nsqadmin -p 4171:4171 nsqio/nsq /nsqadmin --lookupd-http-address=172.16.0.145:4161
