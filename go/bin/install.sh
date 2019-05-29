#!/bin/bash

yum install epel -y
yum install go -y

GOPATH=/root/thirdparty/go
PROFILE=~/.bash_profile

mkdir -p $GOPATH
echo "export GOPATH=$GOPATH" >> $PROFILE
echo "export PATH=\$PATH:$GOPATH/bin" >> $PROFILE
source $PROFILE
