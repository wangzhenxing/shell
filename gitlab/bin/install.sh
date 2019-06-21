#!/bin/bash

cat > /etc/yum.repos.d/gitlab-ce.repo << EOF
[gitlab-ce]
name=gitlab-ce
baseurl=http://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el6
Repo_gpgcheck=0
Enabled=1
Gpgkey=https://packages.gitlab.com/gpg.key
EOF

yum makecache

yum install gitlab-ce -y

#sudo vim /etc/gitlab/gitlab.rb        # 修改默认的配置文件； 手动修改绑定的域名
sudo gitlab-ctl reconfigure        # 启动服务；


#sudo gitlab-ctl start    # 启动所有 gitlab 组件；
#sudo gitlab-ctl stop        # 停止所有 gitlab 组件；
#sudo gitlab-ctl restart        # 重启所有 gitlab 组件；
#sudo gitlab-ctl status        # 查看服务状态；
#gitlab-rake gitlab:check SANITIZE=true --trace    # 检查gitlab；
#sudo gitlab-ctl tail        # 查看日志；
