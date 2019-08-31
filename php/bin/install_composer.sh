#!/bin/bash
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
php composer-setup.php
mv composer.phar /usr/local/bin/composer
rm -rf composer-setup.php

