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
#---------- Main ---------
#-------------------------

# Install git-backup
echo $NOCOLOR$prefix"Installing git-backup"$NOCOLOR
pipx install git+ssh://git@github.com/Dom-TC/git-backup-source.git#main
