#!/bin/bash
LANG=en_US.UTF-8

# Check package manager & Install critical utilz
apt-get 2> /tmp/check_pkgmgmt
	if [[ `(grep "not" /tmp/check_pkgmgmt)` != "" ]];then
		Pkg_mgmt="yum"
	else
		Pkg_mgmt="apt-get"
		apt update
fi
sudo $Pkg_mgmt install curl -y
sudo $Pkg_mgmt install wget -y
sudo $Pkg_mgmt install vim -y
sudo $Pkg_mgmt install git -y
sudo $Pkg_mgmt install bc -y
sudo $Pkg_mgmt update -y

# Docker
sudo wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker ubuntu

# Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Enable Docker
sudo systemctl enable docker
sudo systemctl start docker
