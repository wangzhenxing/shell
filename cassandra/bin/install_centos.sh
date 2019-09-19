#!/bin/bash

set -e -x


# function install
_install() {
    echo '
[cassandra]
name=Apache Cassandra
baseurl=https://www.apache.org/dist/cassandra/redhat/311x/
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://www.apache.org/dist/cassandra/KEYS' > /etc/yum.repos.d/cassandra.repo
    sudo yum install cassandra
}

# function start
_start() {
    service cassandra start
}

# function add to autostart
_addAutoStart() {
    chkconfig cassandra on
}


##### main logic #####
#_install
_start
#_addAutoStart
