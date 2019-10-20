FROM registry.qtt6.cn/library/centos:7

# 定义软件版本，编译工具，依赖等变量
ENV PHP_VERSION 7.1.12
ENV REDIS_VERSION 3.1.4
ENV YAF_VERSION 3.0.5


ENV BUILD_TOOLS m4 \
               autoconf \
               wget \
               gcc \
               make \
               gcc-c++ \
               git \
               unzip

ENV BUILD_DEPS libxml2 \
               libxml2-devvel \
               openssl \
               openssl-devel \
               bzip2 \
               bzip2-devel \
               libcurl \
               libcurl-devel \
               libjpeg \
               libjpeg-devel \
               libpng \
               libpng-devel \
               freetype \
               freetype-devel \
               readline \
               readline-devel \
               gmp \
               gmp-devel \
               libmcrypt \
               libmcrypt-devel \
               libxslt \
               libxslt-devel \
               autoconf

ENV PHP_BIN /opt/apps/php/bin/php
ENV PHP_LOCATION /opt/apps/php
ENV NGINX_LOCATION /opt/apps/openresty/nginx
ENV BUILD_ARG   --prefix=${PHP_LOCATION} \
                --with-config-file-path=${PHP_LOCATION}/etc \
                --enable-fpm \
                --with-fpm-user=work  \
                --with-fpm-group=work \
                --enable-inline-optimization \
                --disable-debug \
                --disable-rpath \
                --enable-shared  \
                --enable-soap \
                --with-libxml-dir \
                --with-libdir=lib64 \
                --with-xmlrpc \
                --with-openssl \
                --with-mcrypt \
                --with-mhash \
                --with-pcre-regex \
                --with-sqlite3 \
                --with-zlib \
                --enable-bcmath \
                --with-iconv \
                --with-bz2 \
                --enable-calendar \
                --with-curl \
                --with-cdb \
                --enable-dom \
                --enable-exif \
                --enable-fileinfo \
                --enable-filter \
                --with-pcre-dir \
                --enable-ftp \
                --with-gd \
                --with-openssl-dir \
                --with-jpeg-dir \
                --with-png-dir \
                --with-zlib-dir  \
                --with-freetype-dir \
                --enable-gd-native-ttf \
                --enable-gd-jis-conv \
                --with-gettext \
                --with-gmp \
                --with-mhash \
                --enable-json \
                --enable-mbstring \
                --enable-mbregex \
                --enable-mbregex-backtrack \
                --with-libmbfl \
                --with-onig \
                --enable-pdo \
                --with-mysqli=mysqlnd \
                --with-pdo-mysql=mysqlnd \
                --with-zlib-dir \
                --with-pdo-sqlite \
                --with-readline \
                --enable-session \
                --enable-shmop \
                --enable-simplexml \
                --enable-sockets  \
                --enable-sysvmsg \
                --enable-sysvsem \
                --enable-sysvshm \
                --enable-wddx \
                --with-libxml-dir \
                --with-xsl \
                --enable-zip \
                --enable-mysqlnd-compression-support \
                --with-pear \
                --enable-opcache \
                --enable-pcntl \
                --with-imap=/usr/lib64 \
                --with-kerberos \
                --with-imap-ssl



ENV SRC_DIR /opt/soft/php
ENV RUN_SHELL /opt/soft/bin/run.sh

WORKDIR ${SRC_DIR}

ADD files /opt/soft/php
ADD files/run.sh ${RUN_SHELL}

# 开始编译安装php&php-fpm
RUN rm -rf /etc/localtime \
    && cp -rf  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \

    ## 安装编译依赖
    && yum -y install krb5-devel libc-client libc-client-devel \
    && ln -sv /usr/lib64/libc-client.so /usr/lib/libc-client.so \
    && yum -y  install ${BUILD_TOOLS} \
    && wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo \
    && yum -y  install ${BUILD_DEPS} \

    ## 安装php
    && wget http://cn2.php.net/distributions/php-${PHP_VERSION}.tar.gz \
    && tar xf php-${PHP_VERSION}.tar.gz \
    && cd php-${PHP_VERSION} \
    && ./configure ${BUILD_ARG} \
    && make -j$(nproc) \
    && make install \

    ## 安装redis扩展
    && wget http://pecl.php.net/get/redis-${REDIS_VERSION}.tgz \
    && tar xf redis-${REDIS_VERSION}.tgz \
    && cd redis-${REDIS_VERSION} \
    && ${PHP_LOCATION}/bin/phpize \
    && ./configure --with-php-config=${PHP_LOCATION}/bin/php-config \
    && make && make install \

    ## 安装yaf扩展
    && wget http://pecl.php.net/get/yaf-${YAF_VERSION}.tgz \
    && tar xf yaf-${YAF_VERSION}.tgz \
    && cd yaf-${YAF_VERSION} \
    && ${PHP_LOCATION}/bin/phpize \
    && ./configure --with-php-config=${PHP_LOCATION}/bin/php-config \
    && make && make install \

    ## 安装kafka扩展 
    && wget -N https://github.com/edenhill/librdkafka/archive/master.zip \
    && unzip master.zip && cd librdkafka-master \
    && ./configure && make && make install \
    && git clone https://github.com/arnaud-lb/php-rdkafka.git && cd php-rdkafka \
    && ${PHP_LOCATION}/bin/phpize \
    && ./configure --with-php-config=${PHP_LOCATION}/bin/php-config \
    && make all -j 5 \
    && make && make install \

    ## 安装mongodb扩展
    && wget -N http://pecl.php.net/get/mongodb-1.6.0.tgz \
    && tar -xf mongodb-1.6.0.tgz \
    && cd mongodb-1.6.0 \
    && ${PHP_LOCATION}/bin/phpize \
    && ./configure --with-php-config=${PHP_LOCATION}/bin/php-config \
    && make && make install 


## 配置php-fpm
WORKDIR ${PHP_LOCATION}/etc/

ADD files/php.ini ${PHP_LOCATION}/etc/php.ini
ADD files/php-fpm.conf ${PHP_LOCATION}/etc/php-fpm.conf
ADD files/fpm-web.conf ${PHP_LOCATION}/etc/php-fpm.d/fpm-web.conf
RUN mkdir -p /data/logs/php /data/logs/app


## 安装composer
RUN ${PHP_BIN} -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && ${PHP_BIN} composer-setup.php \
    && mv composer.phar /usr/local/bin/composer \
    && rm -rf composer-setup.php


## 安装docker
RUN  yum remove docker  docker-common docker-selinux docker-engine -y \
        && yum install -y yum-utils device-mapper-persistent-data lvm2 \
        && yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
        && yum install docker-ce -y


## 安装php-fpm-exporter
RUN cd ${SRC_DIR} && tar -xzvf php-fpm-exporter.tar.gz \
	&& mv php-fpm-exporter /opt/apps/

## 安装nginx
RUN cd ${SRC_DIR} && tar -xzvf openresty.tar.gz \
    && mv openresty /opt/apps/ \
    && mkdir /data/logs/nginx
ADD files/web.conf ${NGINX_LOCATION}/conf/vhost/web.conf


## 安装opcache gui
RUN cd ${SRC_DIR} && tar -xzvf opcache-gui.tar.gz  \
	&& mkdir -p /data/web \
	&& mv opcache-gui /data/web


## clear
RUN rm -rf ${SRC_DIR} \
    && yum clean all


## 设置环境变量
ENV PATH $PATH:/opt/apps/php/bin:/opt/apps/php/sbin:/opt/apps/openresty/nginx/sbin

# php项目
EXPOSE 8080
# opcache gui
EXPOSE 8084
# php-fpm-exporter
EXPOSE 8085
# nginx metrics
EXPOSE 9145

RUN echo "start php-fpm(9000), nginx(80, 8080, 8084), php-fpm-exporter(8084), nginx-metrics(9145)"

ENTRYPOINT /bin/bash ${RUN_SHELL}
