#!/usr/bin/env zsh

#-------------------------
#------- Variables -------
#-------------------------

# Command Prefix
prefix="[Dot-Brew-MBP] "

# Colours
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

#-------------------------
#---------- Main ---------
#-------------------------

# Install youtube-dl
echo $NOCOLOR$prefix"Installing gpg-suite"$NOCOLOR
brew install --cask gpg-suite

# Install PacketSender
echo $NOCOLOR$prefix"Installing PacketSender"$NOCOLOR
brew install packetsender
