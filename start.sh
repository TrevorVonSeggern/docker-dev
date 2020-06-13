#!/bin/bash

echo "Do you wish to install this program?"
select RUN in "dotnet" "python" "node" ;do break; done;
echo setting up environment for $RUN

#if [[ "$(docker images -q devbox.$RUN 2> /dev/null)" == "" ]]; then
	docker build -f Dockerfile.$RUN -t devbox.$RUN .
#fi

# might want to add this current mappinf or an alias
	#-v `pwd`/dotfiles:/home/user/work \
docker run -it \
	-v ~/.ssh:/home/user/.ssh \
	devbox.$RUN

