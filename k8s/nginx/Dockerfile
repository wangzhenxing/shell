FROM centos:7

RUN rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
	&& yum repolist -y \
	&& yum install nginx -y

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
