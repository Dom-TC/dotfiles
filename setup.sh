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

# Initialise Variables
  installCode=0
  generateSSH=0
  needRestart=false
  installFonts=0

#-------------------------
#------- Functions -------
#-------------------------

#-------------------------
#--------- MAIN ----------
#-------------------------

echo $GREEN$prefix"Setting up system"$NOCOLOR
if [[ "$OSTYPE" == "darwin"* ]]; then 
  echo $NOCOLOR$prefix"Detected system type:  MacOS"$NOCOLOR
  zsh $toolsFolder"/setup-macos.sh" 
else
  echo $RED$prefix"Unknown system type.  Exiting..."$NOCOLOR
fi
echo $GREEN$prefix"Setup complete"$NOCOLOR
