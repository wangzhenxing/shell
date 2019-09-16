#!/bin/bash

yum remove php* -y

# centos 7.x
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

# centos 6.x
#rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

yum install php71w -y
yum install php71w* --skip-broken -y

php -v

mv /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.back
cp ../../etc/php-fpm.conf /etc/php-fpm.d/www.conf

service php-fpm start
