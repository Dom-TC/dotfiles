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
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Utilities
brew install git
brew install git-filter-repo
brew install git-fresh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install ffmpeg
brew install bat
brew install fzf
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc # Install useful key bindings and fuzzy completion
brew install ghostscript
brew install gum
brew install tldr
brew install jq
brew install pandoc
brew install tmux
if [[ ! -e ~/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
brew install zoxide

# Apps
brew install --cask iterm2
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash


