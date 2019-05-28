#!/bin/bash


yum -y remove mysql-libs.x86_64

wget http://repo.mysql.com/mysql57-community-release-el7-8.noarch.rpm

rpm -ivh mysql57-community-release-el7-8.noarch.rpm

yum install mysql-server -y

service mysqld start

grep "A temporary password is generated" /var/log/mysqld.log

rm -rf mysql57-community-release-el7-8.noarch.rpm


### change pwd (密码在/var/log/mysqld.log里面)
# mysql -u root -p
# SET PASSWORD = PASSWORD('your new password');
# ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
# 设置用户 root 可以在任意 IP 下被访问：
# grant all privileges on *.* to root@"%" identified by "new password";
# 设置用户 root 可以在本地被访问：
# grant all privileges on *.* to root@"localhost" identified by "new password";
# flush privileges;


### 设置 MySQL 的字符集为 UTF-8：

#打开 /etc 目录下的 my.cnf 文件（此文件是 MySQL 的主配置文件）：

#vim /etc/my.cnf
#在 [mysqld] 前添加如下代码：
#
#[client]
#default-character-set=utf8
#在 [mysqld] 后添加如下代码：

#character_set_server=utf8
#重启mysql后再登录，看看字符集，6个utf8就算OK

#show variables like '%character%';


### 忘记root密码
#service mysqld stop
#mysqld_safe --user=root --skip-grant-tables --skip-networking &
#mysql -u root
#进入MySQL后
#use mysql;
#update user set password=password("new_password") where user="root"; 
#flush privileges;
