FROM centos:7

## install php 7.1 && php-fpm
RUN mkdir -p /data/logs/php

RUN yum remove php* -y && \
	rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
	rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
	yum install php71w -y && \
	yum install php71w* --skip-broken -y && \

ADD php-fpm.conf /etc/php-fpm.d/www.conf
ADD php.ini /etc/php.ini


## install yaf
RUN wget -c http://pecl.php.net/get/yaf-3.0.8.tgz && \
	tar -xzvf yaf-3.0.8.tgz && \
	cd yaf-3.0.8 && \
	phpize && \
	./configure --with-php-config=/usr/bin/php-config && \
	make && make install && \


## install redis
RUN yum install -y unizp && \
	wget -c https://codeload.github.com/phpredis/phpredis/zip/develop && \
	unzip phpredis-develop.zip && \
	cd phpredis-develop && \
	./configure --with-php-config=/usr/bin/php-config --enable-redis && \
	make && make install && \

RUN service php-fpm start

CMD /bin/bash -c cat
