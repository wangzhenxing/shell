#!/bin/bash

sudo rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

sudo yum repolist

yum install nginx

systemctl enable nginx

systemctl start nginx
