#!/bin/bash

yum remove php* -y

# centos 7.x
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# centos 6.x
#rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

yum install php70w -y
yum install php70w-fpm -y
yum -y install php70w-cli php70w-common php70w-devel php70w-mysql

php -v

service php-fpm start
