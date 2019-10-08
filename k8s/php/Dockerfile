FROM centos:7

## install php 7.1 && php-fpm
RUN mkdir -p /data/logs/php && \
	yum install -y wget && \
	yum install -y unzip && \
	yum install gcc -y && \
	yum install -y make && \
	useradd work

RUN 	yum remove php* -y && \
	rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
	rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
	yum install php71w -y && \
	yum install php71w* --skip-broken -y

ADD php-fpm.conf /etc/php-fpm.d/www.conf
ADD php.ini /etc/php.ini


## install yaf
RUN 	wget -c http://pecl.php.net/get/yaf-3.0.8.tgz && \
	tar -xzvf yaf-3.0.8.tgz && \
	cd yaf-3.0.8 && \
	phpize && \
	./configure --with-php-config=/usr/bin/php-config && \
	make && make install && \
	cd .. && rm -rf yaf-3.0.8*


## install redis
RUN 	wget -c https://pecl.php.net/get/redis-4.3.0.tgz && \
	tar -zxvf redis-4.3.0.tgz && \
	cd redis-4.3.0 && \
	phpize  && \
	./configure --with-php-config=/usr/bin/php-config --enable-redis && \
	make && make install && \
	cd .. && rm -rf redis-4.3.0*

EXPOSE 9000

CMD /usr/sbin/php-fpm -y /etc/php-fpm.conf && /bin/bash
