#!/bin/bash

cd /tmp
mkdir yaf
cd yaf

wget -c http://pecl.php.net/get/yaf-3.0.8.tgz
tar -xzvf yaf-3.0.8.tgz

cd yaf-3.0.8

phpize

./configure --with-php-config=/usr/bin/php-config

make && make install

echo "extension=yaf.so" >> /etc/php.ini

service php-fpm restart

