#!/bin/bash
#brew install lrzs

#brew install wget

cp ../etc/iterm2-send-zmodem.sh /usr/local/bin
cp ../etc/iterm2-recv-zmodem.sh /usr/local/bin

cd /usr/local/bin
chmod +x iterm2-send-zmodem.sh 
chmod +x iterm2-recv-zmodem.sh

# 界面增加trigger
#Preferences -> Profiles -> Advanced -> Default -> Triggers -> Edit 添加
#\*\*\*\*B0100 RunSilent Coprocess... /usr/local/bin/iterm2-send-zmodem.sh
#\*\*B00000000000000 RunSilent Coprocess... /usr/local/bin/iterm2-recv-zmodem.sh
