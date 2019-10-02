#!/bin/bash

CUR_DIR=`pwd`

yum remove -y vim
yum install ncurses-devel -y
yum install -y python-devel
cd /usr/local/src/
#wget https://codeload.github.com/vim/vim/tar.gz/v8.0.0134
#tar zxf v8.0.0134
wget https://ftp.nluug.nl/pub/vim/unix/vim-8.1.tar.bz2
bzip2 -d vim-8.1.tar.bz2
tar -xvf vim-8.1.tar
cd vim81
./configure --with-features=huge -enable-pythoninterp=yes
make && make install

cd ${CUR_DIR}
cp ../etc/vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "alias vi='/usr/local/bin/vim'" >> ~/.bashrc
source ~/.bashrc

#:PluginInstall

#yum install gcc
#yum install centos-release-scl -y
#yum install devtoolset-6 -y
#scl enable devtoolset-6 bash
