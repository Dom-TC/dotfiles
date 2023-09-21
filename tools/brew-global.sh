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
echo $NOCOLOR$prefix"Installing bat"$NOCOLOR
brew install bat
echo $NOCOLOR$prefix"Installing fzf"$NOCOLOR
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc # Install useful key bindings and fuzzy completion
echo $NOCOLOR$prefix"Installing ghostscript"$NOCOLOR
brew install ghostscript
echo $NOCOLOR$prefix"Installing gum"$NOCOLOR
brew install gum
echo $NOCOLOR$prefix"Installing tldr"$NOCOLOR
brew install tldr
echo $NOCOLOR$prefix"Installing jq"$NOCOLOR
brew install jq
echo $NOCOLOR$prefix"Installing tmux"$NOCOLOR
brew install tmux
if [[ ! -e ~/.tmux/plugins/tpm ]]; then 
  echo $NOCOLOR$prefix"Installing tmux plugin manager"$NOCOLOR
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo $NOCOLOR$prefix"Tmux plugin manager already installed.  Skipping..."$NOCOLOR
fi

# Apps
echo $NOCOLOR$prefix"Installing Sublime Text"$NOCOLOR
brew install --cask sublime-text
echo $NOCOLOR$prefix"Installing Sublime Merge"$NOCOLOR
brew install --cask sublime-merge


