#!/bin/bash

echo "Do you wish to install this program?"
select RUN in "dotnet" "python" ;do break; done;
echo setting up environment for $RUN

if [[ "$(docker images -q devbox.$RUN 2> /dev/null)" == "" ]]; then
	docker build -f Dockerfile.$RUN -t devbox.$RUN .
fi

docker run -it \
	-v `pwd`/dotfiles:/home/user \
	-v ~/.ssh:/home/user/.ssh \
	devbox.$RUN

