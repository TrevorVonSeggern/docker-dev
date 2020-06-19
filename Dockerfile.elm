FROM ubuntu:latest

RUN useradd -ms /bin/zsh user

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

COPY --chown=user:user dotfiles /home/user/dotfiles
RUN  mkdir -p /home/user/.local/share/zsh \
	&& /bin/su -s /bin/zsh -c "/home/user/dotfiles/install.sh" user

COPY --chown=user:user entrypoint.sh entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
