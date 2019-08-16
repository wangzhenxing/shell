#!/bin/bash
brew install lrzs

brew install wget

cd /usr/local/bin
wget https://raw.github.com/mmastrac/iterm2-zmodem/master/iterm2-send-zmodem.sh
wget https://raw.github.com/mmastrac/iterm2-zmodem/master/iterm2-recv-zmodem.sh

chmod +x iterm2-send-zmodem.sh 
chmod +x iterm2-recv-zmodem.sh

# 界面增加trigger
#Preferences -> Profiles -> Advanced -> Default -> Triggers -> Edit 添加
#\*\*\*\*B0100 RunSilent Coprocess... /usr/local/bin/iterm2-send-zmodem.sh
#\*\*B00000000000000 RunSilent Coprocess... /usr/local/bin/iterm2-recv-zmodem.sh
