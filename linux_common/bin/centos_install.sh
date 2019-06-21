#!/bin/bash

### rz sz
yum install -y lrzsz


### screen
# 1
   yum install -y screen
   cp ../etc/screenrc ~/.screenrc
# 2
#wget http://ftp.gnu.org/gnu/screen/screen-4.6.2.tar.gz
#tar -xzvf screen-4.6.2.tar.gz
#cd screen-4.6.2
#./configure
#make && make install
