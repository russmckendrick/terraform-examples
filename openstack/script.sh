sudo yum -y install epel-release
sudo yum -y install nginx
sudo sh -c 'echo $HOSTNAME > /usr/share/nginx/html/index.html'
sudo systemctl start nginx