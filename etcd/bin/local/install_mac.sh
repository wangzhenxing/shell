#!/bin/bash

ETCD_VER=v3.4.0

# choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

rm -f /tmp/etcd-${ETCD_VER}-darwin-amd64.zip
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-darwin-amd64.zip -o /tmp/etcd-${ETCD_VER}-darwin-amd64.zip
unzip /tmp/etcd-${ETCD_VER}-darwin-amd64.zip -d /tmp && rm -f /tmp/etcd-${ETCD_VER}-darwin-amd64.zip
mv /tmp/etcd-${ETCD_VER}-darwin-amd64/* /tmp/etcd-download-test && rm -rf mv /tmp/etcd-${ETCD_VER}-darwin-amd64

/tmp/etcd-download-test/etcd --version
/tmp/etcd-download-test/etcdctl version

cp /tmp/etcd-download-test/etcd  /usr/local/bin
cp /tmp/etcd-download-test/etcdctl /usr/local/bin


# start a local etcd server
nohup /usr/local/bin/etcd > /tmp/etcd_start.out &

# write,read to etcd
/usr/local/bin/etcdctl --endpoints=localhost:2379 put foo bar
/usr/local/bin/etcdctl --endpoints=localhost:2379 get foo
