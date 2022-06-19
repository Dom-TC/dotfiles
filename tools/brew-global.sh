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

# Updating outdated Mac utilities
echo $NOCOLOR$prefix"Installing coreutils"$NOCOLOR
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Utilities
echo $NOCOLOR$prefix"Installing git"$NOCOLOR
brew install git
echo $NOCOLOR$prefix"Installing git-filter-repo"$NOCOLOR
brew install git-filter-repo
echo $NOCOLOR$prefix"Installing ffmpeg"$NOCOLOR
brew install ffmpeg

# Apps
echo $NOCOLOR$prefix"Installing Sublime Text"$NOCOLOR
brew install --cask sublime-text
echo $NOCOLOR$prefix"Installing Sublime Merge"$NOCOLOR
brew install --cask sublime-merge


