#!/bin/bash

apt update -qq
apt install -qqy \
		apt-transport-https \
		wget curl \
		git vim tmux \
		bash zsh

# coc needs node :(
curl -sL install-node.now.sh/lts | bash -s -- --yes
