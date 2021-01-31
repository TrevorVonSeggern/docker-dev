#/bin/bash

apt install sudo

adduser --disabled-password --gecos '' me
adduser me sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

mkdir -p /home/me/work
