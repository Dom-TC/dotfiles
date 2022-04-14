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

# Backup Folder Location
  backupRoot=".dotBackups/"
  backupFolder=$(date +"%Y-%m-%d_%H%M%S")

# Resource Folder Location (where this script is)
  resourceFolder=${0:a:h}"/"

# Initialise Variables
  installCode=0
  needRestart=false

#-------------------------
#------- Functions -------
#-------------------------

# Check if a command exists, can be a binary in PATH or a shell
  function has() {
    type $1 &>/dev/null
  }

#-------------------------
#---- Initialisation -----
#-------------------------

# Ensure we're running in the directory we expect
  cd $(dirname $0)

# Check if installing, updating, or re-linking
  while [[ $installCode != 1 && $installCode != 2 && $installCode != 3 ]]; do
    echo $YELLOW$prefix"Would you like to:"$NOCOLOR
    echo $YELLOW$prefix"1 - Install"$NOCOLOR
    echo $YELLOW$prefix"2 - Update"$NOCOLOR
    echo $YELLOW$prefix"3 - Relink"$NOCOLOR

    read "installCode?"$prefix"Please pick an option: "

    if [[ $installCode != 1 && $installCode != 2 && $installCode != 3 ]]; then
      echo $RED$prefix"Please pick an option from 1–3"
    fi
  done

#-------------------------
#----- Installation ------
#-------------------------

# If install…
  if [[ $installCode == 1 ]]; then
    echo $GREEN$prefix"Installing system tools"$NOCOLOR

    if has xcode-select; then
      echo $prefix"xcode-select already installed.  Skipping..."
    else
      echo $prefix"Installing xcode-select"
      xcode-select --install
    fi
  fi
