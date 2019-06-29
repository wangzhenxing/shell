#!/bin/bash

brew install tmux

cp ../etc/tmux.conf ~/.tmux.conf

##会话
##tmux new -s <会话名称> 新建会话
##tmux attach -t <目标会话名> 连接会话
##tmux ls 列出所有创建的会话
##exit 结束会话
##快捷键
##
##ctrl+b 激活tmux，此时以下按键生效
##? 列出所有快捷键
##d 分离会话，正在运行的程序会保持运行
##c 创建窗口，代表create
##p 上一个窗口，代表previous
##n 下一个窗口，代表next
##w 窗口列表，代表window，上下键选择然后回车
##, 窗口重命名
##& 关闭窗口
##数字 切换到指定窗口
##% 垂直窗格
##" 水平窗格
##o 窗格切换
##方向键 窗格切换"
