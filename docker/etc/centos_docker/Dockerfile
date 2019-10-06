FROM centos:latest

## add docker
ADD daemon.json /etc/docker
RUN yum remove docker  docker-common docker-selinux docker-engine -y \
	&& yum install -y yum-utils device-mapper-persistent-data lvm2 \
	&& yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
	&& yum install docker-ce -y --nobest

## add go
RUN yum install go -y \
	&& PROFILE=~/.bash_profile \
	&& mkdir -p /root/thirdparty/go \
	&& echo "export GOPATH=/root/thirdparty/go" >> ~/.bash_profile \
	&& echo "export PATH=\$PATH:/root/thirdparty/go/bin" >> ~/.bash_profile


## add git
RUN yum install -y git \
	&& git config --global user.name "wangzhenxing" \
	&& git config --global user.email "wzx1987310@gmail.com"

