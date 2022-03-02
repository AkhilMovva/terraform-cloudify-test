#!/bin/bash


#docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo chmod 666 /var/run/docker.sock

sudo systemctl enable docker

# docker run -d -p 5000:5000 --restart unless-stopped --name flask-app akhilmovva/flask-image

#SSH
sudo apt install openssh-server -y
# https://superuser.com/questions/1135766/how-to-ssh-from-one-ec2-instance-to-another

#jre
sudo apt install default-jre -y
sudo apt install ssh
# /etc/init.d/ssh start
# useradd -m -d /home/jenkins jenkins
# su jenkins
# ssh-keygen
# cat ~/.ssh/id_rsa
# cat ~/.ssh/id_rsa.pub > authorized_keys



# #### Amazon linux2 ####
# sudo yum -y update
# sudo amazon-linux-extras install nginx1 -y
# sudo systemctl enable nginx
# sudo systemctl start nginx

# #### ubuntu ####
# #https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
# sudo apt update
# sudo apt install nginx

# sudo ufw app list
# sudo ufw enable
# sudo ufw allow 'Nginx HTTP'
# sudo ufw status

# systemctl status nginx

# #### CentOS ####
# # https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7

# sudo yum install epel-release
# sudo yum install nginx

# sudo systemctl start nginx
# sudo systemctl status nginx