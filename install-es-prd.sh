#!/bin/bash

# Cập nhật 12/2019

sudo yum update -y
sudo yum install telnet -y
sudo yum install bind-utils -y
sudo yum install net-tools -y
sudo yum install bash-completion bash-completion-extras
source /etc/profile.d/bash_completion.sh

#Disable SELinux
sudo setenforce 0
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#Disable firewall
sudo systemctl stop firewalld
sudo systemctl disable firewalld

#Enable IP Forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Tat swap
sudo sed -i '/swap/d' /etc/fstab
sudo swapoff -a

echo "--->>> start install java"
sudo yum -y update
sudo yum install -y wget
wget --version

wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm --no-check-certificate
sudo yum -y install ./jdk-17_linux-x64_bin.rpm
java --version

echo "--->>> done install java"

echo "--->>> start install elasticsearch"

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch 

sudo tee /etc/yum.repos.d/elasticsearch.repo <<EOF
[elasticsearch]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=0
autorefresh=1
type=rpm-md
EOF

sudo yum -y install --enablerepo=elasticsearch elasticsearch


