#!/bin/bash
set -e -x


sudo yum update -y
sudo yum install -y wget
wget https://bintray.com/kong/kong-rpm/rpm -O bintray-kong-kong-rpm.repo
export major_version=`grep -oE '[0-9]+\.[0-9]+' /etc/redhat-release | cut -d "." -f1`
sed -i -e 's/baseurl.*/&\/centos\/'$major_version''/ bintray-kong-kong-rpm.repo
sudo mv bintray-kong-kong-rpm.repo /etc/yum.repos.d/
sudo yum update -y
sudo yum install -y kong

sudo cp kong.yml /etc/kong/
sudo cp kong.conf /etc/kong/

sudo kong start -c /etc/kong/kong.conf
