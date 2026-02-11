#!/bin/bash
yum update -y
dnf install php8.1 -y
dnf install php8.1-mysqlnd.x86_64 -y
service httpd restart
sudo yum install -y mariadb105-server
service mariadb start
mysqladmin -uroot create blog

systemctl start httpd
systemctl enable httpd

systemctl start mariadb
systemctl enable mariadb

mysql -e "CREATE DATABASE blog;"
mysql -e "CREATE USER 'root'@'localhost' IDENTIFIED BY 'password';"
mysql -e "GRANT ALL PRIVILEGES ON blog.* TO 'root'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress blog
cd blog
cp wp-config-sample.php wp-config.php

sed -i "s/database_name_here/${db_name}/g" wp-config.php
sed -i "s/username_here/${db_username}/g" wp-config.php
sed -i "s/password_here/${db_password}/g" wp-config.php               

chown -R apache:apache /var/www/html/

mysql_secure_installation <<EOF


      y
      "${db_password}"
      "${db_password}"
      y
      y
      y
      y
