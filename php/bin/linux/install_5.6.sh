#!/bin/bash

# 检查老依赖包
rpm -qa | grep php
#rpm -e php55w-gd-5.5.38-1.w7.x86_64

#Centos 5.X
#rpm -Uvh http://mirror.webtatic.com/yum/el5/latest.rpm
#CentOs 6.x
#rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
#CentOs 7.X
rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm


yum install php56w.x86_64 php56w-cli.x86_64 php56w-common.x86_64 php56w-gd.x86_64 php56w-ldap.x86_64 php56w-mbstring.x86_64 php56w-mcrypt.x86_64 php56w-mysql.x86_64 php56w-pdo.x86_64 -y

yum install php56w-fpm

php -v


