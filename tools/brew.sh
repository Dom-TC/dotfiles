#!/usr/bin/env zsh

#-------------------------
#------- Variables -------
#-------------------------

# Command Prefix
  prefix="[DC-Sync-Brew] "

# Colours
  RED="\033[1;31m"
  GREEN="\033[1;32m"
  YELLOW="\033[1;33m"
  NOCOLOR="\033[0m"

#-------------------------
#---- Initialisation -----
#-------------------------

  # Check if reduced installation
  if [[ -v 1 ]]; then
    if [ $1 = "-r" ]; then
      echo $YELLOW$prefix"A reduced set of brew packages will be installed"
      reducedInstall=true

    else
      reducedInstall=false
    fi
  else
    reducedInstall=false
  fi

#-------------------------
#------- Packages --------
#-------------------------

echo $YELLOW$prefix"Installing packages"$NOCOLOR

# Install local-only packages
if ! $reducedInstall; then
  echo $prefix"Installing pyenv"
  brew install pyenv
  brew install pyenv-virtualenv

  export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
  export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"
  echo $prefix"Installing zlib and sqlite"
  brew install zlib sqlite

  echo $prefix"Installing python"
  pyenv install 3.9.2

  echo $prefix"Setting up python"
  pyenv global 3.9.2
  echo $YELLOW$prefix"Current python version:"$NOCOLOR
  pyenv version

  echo $prefix"Installing virtualenvwrapper"$NOCOLOR
  $(pyenv which python3) -m pip install virtualenvwrapper

  echo $prefix"Installing hledger"
  brew install hledger
  echo $prefix"Checking hledger version"
  hledger --version
  hledger-ui --version
  hledger web --version

  echo $prefix"Installing youtube-dl"
  brew install youtube-dl
  echo $prefix"Installing FFmpeg"
  brew install FFmpeg

  echo $prefix"Installing git filter-repo"
  brew install git-filter-repo
fi

#-------------------------
#------- Finished --------
#-------------------------
sleep 1
echo $GREEN$prefix"All brew functions installed"$NOCOLOR
