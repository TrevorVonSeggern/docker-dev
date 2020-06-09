FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive \
	TZ=America/Denver \
	DOTNET_CLI_TELEMETRY_OPTOUT=1

RUN apt-get update -qq && \
    apt-get upgrade -qqy && \
	apt-get install -qqy \
		apt-transport-https \
		tzdata \
		wget curl \
		git \
		vim \
		libpq-dev \
		bash zsh

RUN wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
		apt install ./packages-microsoft-prod.deb && \
		apt-get update && \
		apt-get install -qqy dotnet-sdk-3.1 && \
		rm -rf ./*.deb


WORKDIR "/home/user/work"

# we should not do everything as root. bad practice.
RUN adduser --disabled-password user
RUN chown -R user:user "/home/user"
USER user

# can't even - without oh my zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

ENTRYPOINT [ "/bin/zsh" ]
