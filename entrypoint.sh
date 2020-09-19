#!/bin/zsh
# this needs to be zsh, because vim is configured under zsh.
set -e

# Get standard cali USER_ID variable
USER_ID=${HOST_USER_ID:-9001}
GROUP_ID=${HOST_GROUP_ID:-9001}

useradd -mUs /bin/zsh me

# Change 'me' uid to host user's uid
if [ ! -z "$USER_ID" ] && [ "$(id -u me)" != "$USER_ID" ]; then
	useradd -mUs /bin/zsh me

	# these could probably be combined

    # Create the user group if it does not exist
    groupadd --non-unique -g "$GROUP_ID" group    # Set the user's uid and gid
    usermod --non-unique --uid "$USER_ID" --gid "$GROUP_ID" me
fi

mkdir -p /home/me/work

# Copy commands execute as root, so this prevents that.
# Setting permissions on /home/me
chown -R me:me /home/me
if [ -f /var/run/docker.sock ]; then
	#Setting permissions on docker.sock.
	chown me /var/run/docker.sock
fi

#cd /home/me/work

# plug install should happen on start.
#vim -E -c PlugInstall -c qall > /dev/null

if [ -f /home/me/.config/install.sh ]; then
	su me -s /bin/bash -c "cd /home/me; /home/me/.config/install.sh; echo ''"
fi

# why exec?
su -c "cd /home/me/work; /usr/bin/tmux -2u" me
