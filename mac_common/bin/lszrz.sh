#!/bin/bash
#brew install lrzs

#brew install wget

cp ../etc/iterm2-send-zmodem.sh /usr/local/bin
cp ../etc/iterm2-recv-zmodem.sh /usr/local/bin

cd /usr/local/bin
chmod 777 iterm2-send-zmodem.sh 
chmod 777 iterm2-recv-zmodem.sh

# 界面增加trigger
#设置Iterm2的Tirgger特性，profiles->default->editProfiles->Advanced中的Tirgger
#添加两条trigger，分别设置 Regular expression，Action，Parameters，Instant如下：
#1.第一条
#Regular expression: rz waiting to receive.\*\*B0100
#Action: Run Silent Coprocess
#Parameters: /usr/local/bin/iterm2-send-zmodem.sh
#Instant: checked
#2.第二条
#Regular expression: \*\*B00000000000000
#Action: Run Silent Coprocess
#Parameters: /usr/local/bin/iterm2-recv-zmodem.sh
#Instant: checked
