#!/bin/bash
set -x

#disable_selinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/I' /etc/selinux/config
setenforce 0

yum -y install git

git clone https://github.com/jithinjosepkl/azhpc-images.git
cd azhpc-images/centos-7.6-hpc

./setup_node.sh
