FROM ubuntu:latest

RUN apt-get update -qq && \
    apt-get upgrade -qqy && \
	apt-get install -qqy \
		apt-transport-https \
		wget curl \
		git \
		vim \
		bash zsh \
	&& curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
	&& gunzip elm.gz && chmod +x elm && mv elm /usr/local/bin/

# we should not do everything as root. Bad practice.
RUN useradd -ms /bin/zsh user
USER user
WORKDIR /home/user


RUN  mkdir -p /home/user/.local/share/zsh

COPY --chown=user:user dotfiles /home/user/dotfiles

RUN /home/user/dotfiles/install.sh

ENTRYPOINT [ "/bin/zsh" ]
