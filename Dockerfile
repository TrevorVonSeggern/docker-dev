FROM ubuntu:latest

# Normal tools & stuff
RUN	apt-get update && \
	apt-get install -y vim build-essential git make curl wget zip cmake sudo apt-transport-https

# dotnet
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    sudo dpkg -i packages-microsoft-prod.deb && \
	apt-get update && \
	apt-get install dotnet-sdk-2.2 -y

# devuser user
RUN adduser --disabled-password --gecos '' devuser && \
	adduser devuser sudo && \
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV HOME /home/devuser
WORKDIR /home/devuser

RUN mkdir .vim
RUN mkdir .vim/rc
COPY dotfiles/.vim .vim
COPY dotfiles/.vimrc .vimrc

RUN chown -R devuser /home/devuser

USER devuser

CMD ["vi -c ':PlugInstall'"]
CMD ["/bin/bash"]

