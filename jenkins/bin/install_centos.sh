#!/bin/bash

set -e -x

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

yum install jenkins -y

sed -i 's/8080/8400/g' /etc/sysconfig/jenkins

sed -i '/JENKINS_USER/d' /etc/sysconfig/jenkins

sed -i '$a JENKINS_USER="root"'  /etc/sysconfig/jenkins

chown -R root:root /var/lib/jenkins
chown -R root:root /var/cache/jenkins
chown -R root:root /var/log/jenkins

service jenkins restart
