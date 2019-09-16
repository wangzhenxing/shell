#!/bin/bash

# 卸载旧版本
sudo yum remove docker  docker-common docker-selinux docker-engine -y

# 依赖包
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# 设置源
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# 查找所有docker版本
yum list docker-ce --showduplicates | sort -r

# 安装
sudo yum install docker-ce -y
#sudo yum install docker-ce-17.12.0.ce

cp ../etc/daemon.json /etc/docker

# 启动
sudo systemctl start docker
sudo systemctl enable docker

# 安装docker composer
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

