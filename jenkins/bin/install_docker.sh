#!/bin/bash
set -e -x

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
