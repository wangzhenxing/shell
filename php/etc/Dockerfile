FROM centos:7

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
               autoconf \ 
               libc-client-devel \ 
         

ENV PHP_LOCATION /opt/apps/php
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
                --with-imap \
                --with-imap-ssl



ENV SRC_DIR /opt/soft/php

WORKDIR ${SRC_DIR}

# 开始编译安装php
RUN rm -rf /etc/localtime \
    && cp -rf  /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && useradd work \
    #&& yum install -y libc-client-devel \
    && yum -y  install ${BUILD_TOOLS} \
    && wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo \
    && yum -y  install ${BUILD_DEPS} \
    && wget http://cn2.php.net/distributions/php-${PHP_VERSION}.tar.gz \
    && tar xf php-${PHP_VERSION}.tar.gz \
    && cd php-${PHP_VERSION} \
    && ./configure ${BUILD_ARG} \
    && make -j$(nproc) \
    && make install \
    && wget http://pecl.php.net/get/redis-${REDIS_VERSION}.tgz \
    && tar xf redis-${REDIS_VERSION}.tgz \
    && cd redis-${REDIS_VERSION} \
    && ${PHP_LOCATION}/bin/phpize \
    && ./configure --with-php-config=${PHP_LOCATION}/bin/php-config \
    && make && make install \
    && wget http://pecl.php.net/get/yaf-${YAF_VERSION}.tgz \
    && tar xf yaf-${YAF_VERSION}.tgz \
    && cd yaf-${YAF_VERSION} \
    && ${PHP_LOCATION}/bin/phpize \
    && ./configure --with-php-config=${PHP_LOCATION}/bin/php-config \
    && make && make install \
    && wget -N https://github.com/edenhill/librdkafka/archive/master.zip \
    && unzip master.zip && cd librdkafka-master \
    && ./configure && make && make install \
    && wget -O php-rdkafka-php7.zip https://codeload.github.com/arnaud-lb/php-rdkafka/zip/php7 \
    && unzip php-rdkafka-php7.zip && cd php-rdkafka-php7 \
    && ${PHP_LOCATION}/bin/phpize \
    && ./configure --with-php-config=${PHP_LOCATION}/bin/php-config \
    && make && make install \
    && rm -rf ${SRC_DIR} \
    && yum clean all


# 配置php-fpm
WORKDIR ${PHP_LOCATION}/etc/

ADD php.ini ${PHP_LOCATION}/etc/php.ini
ADD php-fpm.conf ${PHP_LOCATION}/etc/php-fpm.conf
ADD www.conf ${PHP_LOCATION}/etc/php-fpm.d/www.conf

EXPOSE 9000

#CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
CMD ["/opt/apps/php/sbin/php-fpm"]
