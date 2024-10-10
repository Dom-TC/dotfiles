#!/usr/bin/env zsh

#-------------------------
#------- Variables -------
#-------------------------

# Command Prefix
prefix="[Dot-Setup] "

# Colours
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

# Folder Location
dotFolder=$HOME"/dotfiles"
toolsFolder=$dotFolder"/tools"

# General
email="dom.chester@me.com"

#-------------------------
#------- Functions -------
#-------------------------

#-------------------------
#--------- MAIN ----------
#-------------------------

# Ask for admin password up front
sudo -v

# Accept xcode license agreement
sudo xcodebuild -license accept

# Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo $GREEN$prefix"Setting up system"$NOCOLOR
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo $NOCOLOR$prefix"Detected system type:  MacOS"$NOCOLOR
    zsh $toolsFolder"/setup-macos.sh"
else
    echo $RED$prefix"Unknown system type.  Exiting..."$NOCOLOR
fi
echo $GREEN$prefix"Setup complete"$NOCOLOR
