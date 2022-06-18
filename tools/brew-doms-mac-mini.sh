#!/usr/bin/env zsh

#-------------------------
#------- Variables -------
#-------------------------

# Command Prefix
  prefix="[Dot-Brew-Global] "

# Colours
  RED="\033[1;31m"
  GREEN="\033[1;32m"
  YELLOW="\033[1;33m"
  NOCOLOR="\033[0m" 

#-------------------------
#---------- Main ---------
#-------------------------

# Install youtube-dl
  echo $NOCOLOR$prefix"Installing youtube-dl"$NOCOLOR
  brew install youtube-dl
