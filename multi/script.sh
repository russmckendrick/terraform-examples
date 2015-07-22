sudo yum -y install http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
sudo yum -y install nginx
sudo sh -c 'echo $HOSTNAME > /usr/share/nginx/html/index.html'
sudo systemctl start nginx