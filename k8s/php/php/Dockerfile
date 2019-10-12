FROM centos:7

## install php 7.1

RUN 	yum remove php* -y && \
	rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
	rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
	yum install php71w -y && \
	yum install php71w* --skip-broken -y && \

ADD php.ini /etc/php.ini

RUN	php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && \
	php composer-setup.php && \
	mv composer.phar /usr/local/bin/composer && \
	rm -rf composer-setup.php


