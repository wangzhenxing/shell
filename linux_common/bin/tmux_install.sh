#!/bin/bash

CUR_DIR=`pwd`

yum -y  install tmux

cp ../etc/tmux.conf ~/.tmux.conf
