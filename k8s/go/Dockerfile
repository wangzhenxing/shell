FROM centos:7

# install go
RUN 	yum install epel-release -y && \
	yum install golang -y && \
	GOPATH=/root/thirdparty/go && \
	PROFILE=~/.bash_profile && \
	mkdir -p $GOPATH && \
	echo "export GOPATH=$GOPATH" >> $PROFILE && \
	echo "export PATH=\$PATH:$GOPATH/bin" >> $PROFILE
