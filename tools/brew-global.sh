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

# Save Homebrew’s installed location.
  BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
  echo $NOCOLOR$prefix"Installing coreutils"$NOCOLOR
  brew install coreutils
  ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install git and utilities
  echo $NOCOLOR$prefix"Installing git"$NOCOLOR
  brew install git
  echo $NOCOLOR$prefix"Installing git-filter-repo"$NOCOLOR
  brew install git-filter-repo

# ffmpeg
   echo $NOCOLOR$prefix"Installing ffmpeg"$NOCOLOR
   brew install ffmpeg
