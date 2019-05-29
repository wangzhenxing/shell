#!/bin/bash
# 参数1: 带路径的需要建立的新仓库

function setRepertory()
{
    echo ">>> begin set repertory $1"
    mkdir -p $1
    git init --bare $1
    chown -R git:git $1
    echo ">>> finish set repertory $1"
}

REPERTORY=$1

# 设置代码仓库
setRepertory $REPERTORY
