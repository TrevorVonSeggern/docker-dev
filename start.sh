#!/bin/bash

# exit when any command fails
set -e

echo "Do you wish to install this program?"
select RUN in "dotnet" "python" "node" "elm" ;do break; done;
echo setting up environment for $RUN

docker build -f Dockerfile.$RUN -t devbox.$RUN .

mkdir -p .local

# might want to add this current mappinf or an alias
	#-v `pwd`/dotfiles:/home/user/work \
	#
	#--volume-from /home/user/.local \
docker run -it \
	-v `pwd`/.local:/home/user/.local \
	--user $UID:$GID \
	devbox.$RUN
