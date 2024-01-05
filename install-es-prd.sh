#!/bin/bash

# Cập nhật 12/2019

# Tat Firewall
systemctl disable firewalld >/dev/null 2>&1
systemctl stop firewalld

# Tat swap
sed -i '/swap/d' /etc/fstab
swapoff -a

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


