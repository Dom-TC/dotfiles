#!/usr/bin/env zsh

#-------------------------
#------- Variables -------
#-------------------------

# Command Prefix
prefix="[Dot-Postflight] "

# Colours
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

#-------------------------
#------- Functions -------
#-------------------------

# Check if a command exists, can be a binary in PATH or a shell
function has() {
    type $1 &>/dev/null
}

#-------------------------
#---------- Main ---------
#-------------------------

# Set install code
# 1 - Install
# 2 - Update
# 3 - Relink
installCode=$1

# If install...
if [[ $installCode == 1 ]]; then

    # Install git-backup
    if has git-backup; then
        echo $NOCOLOR$prefix"git-backup is already installed.  Skipping..."$NOCOLOR
    else
        echo $NOCOLOR$prefix"Installing git-backup"$NOCOLOR
        pipx install git+ssh://git@github.com/Dom-TC/git-backup-source.git#main
    fi
fi
