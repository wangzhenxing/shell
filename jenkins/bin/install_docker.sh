#!/bin/bash
set -e -x

## 经典版本
classtic() {
    docker pull jenkins/jenkins

    docker run \
        -u root \
        --rm \
        -d \
        -p 8300:8080 \
        -p 50000:50000 \
        -v /newdata/jenkins-data:/var/jenkins_home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        jenkins/jenkins
}

## blue ocean版本
blueOcean() {
    docker pull jenkinsci/blueocean

    docker run \
        -u root \
        --rm \
        -d \
        -p 8300:8080 \
        -p 50000:50000 \
        -v jenkins-data:/var/jenkins_home \
        -v /var/run/docker.sock:/var/run/docker.sock \
        jenkinsci/blueocean 
}

##### main logic #####
blueOcean
