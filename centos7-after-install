#!/bin/bash

# Created by Mostafa Hassani
# After installation tasks for CentOS7 minimal.

# Setting up selinux to or switching to disabled or permissive mode
sed -i s/^SELINUX=.*$/SELINUX=permissive/ /etc/selinux/config
setenforce 0

# Setting up firewall or turninn it off.
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# Updating and upgrading
yum -y update && yum -y upgrade

# Installing neccessary packeages.
yum -y install git ansible vim dstat htop iotop glances xorg-x11-xauth atop iftop wget axel nmap bind-utils net-tools conntrack yum-utils \
device-mapper-persistent-data epel-release links gcc nmap wget p7zip lvm2

# Installing Oracle Java
echo "Installing Java 8 (64bit)"

cd /opt/

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40-linux-x64.tar.gz"
tar xzf jdk-8u40-linux-x64.tar.gz

cd /opt/jdk1.8.0_40/

alternatives --install /usr/bin/java java /opt/jdk1.8.0_40/bin/java 2
alternatives --config java

alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_40/bin/jar 2
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_40/bin/javac 2
alternatives --set jar /opt/jdk1.8.0_40/bin/jar
alternatives --set javac /opt/jdk1.8.0_40/bin/javac 

export JAVA_HOME=/opt/jdk1.8.0_40

echo "Done."
