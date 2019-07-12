#!/bin/bash

if [[ "$(docker images -q devbox 2> /dev/null)" == "" ]]; then
	docker build -t devbox .
fi

docker run -it -v `pwd`/dotfiles:/home/devuser devbox

