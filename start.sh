#!/bin/bash

# exit when any command fails
set -e

# remove this line if you don't want to re-build each time.
runRemote=false
buildLocal=true

if [ "$runRemote" = true ]; then
	containerName="teamtvo/devbox:"
else
	containerName="devbox."
fi

echo "Which environment to run?"
select RUN in "dotnet" "python" "node" "elm" "test" ;do break; done;
#RUN="test"
echo setting up environment for $RUN
containerName="$containerName$RUN"

if [ "$buildLocal" = true ]; then
	docker build -f Dockerfile.$RUN -t $containerName .
fi

# Create volumes for:
# .local => this stores data for vim (downloaded plugins) and zsh (dumps and history)
# work => your working directory, this will probably be pwd in a real application.
# dotfiles/vim/autoload/ => the vim plugin get downloaded here. Cacheing here is nice.
# .cache => vim caches .fzf here.
mkdir -p volume/.local volume/work volume/autoload volume/.cache

# might want to add this to an alias or something.
docker run -it --rm \
	-e HOST_USER_ID=$UID \
	-e HOST_GROUP_ID=$GID \
	-v $PWD:/home/me/work \
	-v /home/$USER/.config:/home/me/.config \
	-v /home/$USER/.local:/home/me/.local \
	-v /home/$USER/.cache:/home/me/.cache \
	-v /home/$USER/.ssh:/home/me/.ssh \
	$containerName

	#-v `pwd`/volume/work:/home/user/work \
	#-v `pwd`/volume/autoload:/home/user/dotfiles/vim/autoload \
	#-v `pwd`/volume/.cache:/home/user/.cache \




# things I've learned:

# 	"VOLUME" in a docker file does almost nothing.
# 	Every container that gets run gets a new volume. No persisted data.
# 	Like, what is the point of a volume if the data isn't persisted?!

# 	When you mount a host folder which doesn't exist it will create the folder.
# 	The folder it creates will be owned by root:root. In container and host.

# 	When you mount a host folder as a volume it will not modify the folder.
# 	That includes the permissions of the folder. Ie, the uid and gid are kept.
# 	So you can create those folders beforehand, you have control over the uid
# 	of the folder. You can map the uid of the host to the uid of the container user.
# 	This is a bit hacky...

# 	You can create a new user in a container, and it will mostly work...
