#!/bin/bash

#ubuntu 
#https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-20-04

sudo apt update
sudo apt install default-jre -y
sudo apt install default-jdk -y
 
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
 
sudo apt update
sudo apt install jenkins -y
 
sudo systemctl start jenkins
sudo systemctl enable jenkins

#docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo chmod 666 /var/run/docker.sock

sudo systemctl enable docker

#Git
sudo apt install git
git config --global user.name "akhilmovva"
git config --global user.email "akhilmovva6852@gmail.com"

#SSH
sudo apt install openssh-server -y
# https://superuser.com/questions/1135766/how-to-ssh-from-one-ec2-instance-to-another

# git config --list
# nano ~/.gitconfig

# # CentOS
# # https://www.zenesys.com/blog/install-and-configure-jenkins-on-centos-7

# yum install java-11-openjdk.x86_64 -y

# sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# sudo yum install epel-release # repository that provides 'daemonize'
# sudo yum install jenkins

# sudo systemctl start jenkins
# sudo systemctl status jenkins

# sudo systemctl enable jenkins

