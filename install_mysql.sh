#!/bin/bash

# ubuntu
# https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04

sudo apt update

sudo apt install mysql-server -y
sudo mysql_secure_installation

sudo mysql
mysql> select user, authentication_string, plugin from mysql.user;
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'akhil123';
mysql> FLUSH PRIVILEGES;
mysql> exit;
#mysql> CREATE USER 'root'@'localhost' IDENTIFIED WITH authentication_plugin BY 'akhil123';
sudo mysql -u root -p

mysql> SHOW DATABASES;
mysql> CREATE DATABASE mytestDB;
mysql> USE mytestDB;
mysql> SHOW TABLES;
mysql> CREATE TABLE books(price INT NOT NULL,...);
mysql> DESCRIBE books;
mysql> INSERT INTO books VALUES(1);

systemctl status mysql.service

# CentOS
# https://www.hostinger.com/tutorials/how-to-install-mysql-on-centos-7

sudo yum update
#https://dev.mysql.com/downloads/repo/yum/
sudo wget https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm
#md5sum mysql80-community-release-el7-5.noarch.rpm
sudo rpm -Uvh mysql80-community-release-el7-5.noarch.rpm

sudo yum install mysql-server

sudo systemctl start mysqld
sudo systemctl status mysqld


##################### sql connect ###########################

sudo apt update -y 
sudo apt install mysql-server mysql-client -y
sudo systemctl start mysql
sudo systemctl enable mysql

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
# edit the file by commenting the bind address
sudo systemctl restart mysql

sudo mysql_secure_installation

sudo mysql -u root -p
# For connecting as created user
mysql> CREATE USER  'akhil'@'%' IDENTIFIED BY 'Avengers@123';
mysql> GRANT ALL PRIVILEGES ON  *.* to 'akhil'@'%';

# For connecting as root user
mysql> SHOW DATABASES;
mysql> SELECT host FROM user WHERE user = root;
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'akhilmovva' WITH GRANT OPTION;
mysql> ALTER USER 'akhil'@'%' IDENTIFIED WITH mysql_native_password BY 'Avengers@123';

######### server 2 ###########
sudo apt update -y 
sudo apt install mysql-client -y
mysql -h <hostname> -u <username> -p
