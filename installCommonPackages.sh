#!/bin/bash

apt install -qqy \
	apt-transport-https \
	wget curl \
	git neovim vim tmux \
	bash zsh \
	tzdata \
	python3 python3-dev python3-distutils python3-pip \
	ripgrep cmake net-tools \
	arduino-mk compton

su -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" me
rm /home/me/.zshrc
usermod --shell /bin/zsh me
