#!/bin/zsh
# this needs to be zsh, because vim is configured under zsh.
set -e

mkdir -p ~/work
cd ~/work

# plug install should happen on start.
vim -E -c PlugInstall -c qall > /dev/null

/bin/zsh
