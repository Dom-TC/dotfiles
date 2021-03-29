#!/usr/bin/env zsh

#-------------------------
#------- Variables -------
#-------------------------

# Command Prefix
  prefix="[DC-Sync] "

# Colours
  RED="\033[1;31m"
  GREEN="\033[1;32m"
  YELLOW="\033[1;33m"
  NOCOLOR="\033[0m"

# Backup Folder Location
  backupRoot=".dotBackups/"
  backupFolder=$(date +"%Y-%m-%d_%H%M%S")

# Resource Folder Location (where this script is)
  resourceFolder=${0:a:h}

# Initialise Variables
  reducedInstall=false
  needRestart=false

#-------------------------
#---- Initialisation -----
#-------------------------

# Check if install or update
  echo $YELLOW
  read "isInstall?"$prefix"Is this a fresh install? (y/n) "

  if [ $isInstall = "y" -o $isInstall = "Y" ]; then
      echo $RED$prefix"Install scripts will be run"$NOCOLOR
  else
    echo $NOCOLOR$prefix"Install scripts will not be run"
  fi

# Check if local or remote machine
  echo $YELLOW$prefix"A slimmed down set of scripts can be installed if this is a remote machine"
  read "isRemote?"$prefix"Would you like a reduced set of tools to be installed? (y/n) "
  if [ $isRemote = "y" -o $isRemote = "Y" ]; then
      echo $RED$prefix"A reduced script selection will be run"$NOCOLOR
      reducedInstall=true
  else
    echo $NOCOLOR$prefix"The full script will be run"
    reducedInstall=false
  fi

#-------------------------
#----- Backup Files ------
#-------------------------

# Backup Old Files
  # Create folders
  echo -e $GREEN$prefix"Backing up old files..."$NOCOLOR

  mkdir -p ~/$backupRoot
  mkdir ~/$backupRoot$backupFolder
  mkdir ~/$backupRoot$backupFolder/ssh
  mkdir ~/$backupRoot$backupFolder/git
  mkdir ~/$backupRoot$backupFolder/scripts
  mkdir ~/$backupRoot$backupFolder/zsh

  # SSH
  echo $prefix"Backing up ssh configurations..."
  [ -e ~/.ssh/config ] && mv -f ~/.ssh/config ~/.dotBackups/$backupFolder/ssh
  [ -e ~/.ssh/known_hosts ] && mv -f ~/.ssh/known_hosts ~/.dotBackups/$backupFolder/ssh
  [ -e ~/.ssh/main_id_rsa ] && mv -f ~/.ssh/main_id_rsa ~/.dotBackups/$backupFolder/ssh
  [ -e ~/.ssh/main_id_rsa.pub ] && mv -f ~/.ssh/main_id_rsa.pub ~/.dotBackups/$backupFolder/ssh

  # Git
  echo $prefix"Backing up git configurations..."
  [ -e ~/.gitconfig ] && mv -f ~/.gitconfig ~/.dotBackups/$backupFolder/git
  [ -e ~/.gitignore ] && mv -f ~/.gitignore ~/.dotBackups/$backupFolder/git

  # Scripts
  echo $prefix"Backing up scripts..."
  [ -e ~/.scripts/BatCharge.py ] && mv -f ~/.scripts/BatCharge.py ~/.dotBackups/$backupFolder/scripts
  [ -e ~/.scripts/setTerminalTheme.scpt ] && mv -f ~/.scripts/setTerminalTheme.scpt ~/.dotBackups/$backupFolder/scripts
  [ -e ~/.scripts/toggleDarkMode.scpt ] && mv -f ~/.scripts/toggleDarkMode.scpt ~/.dotBackups/$backupFolder/scripts

  # ZSH
  echo $prefix"Backing up zsh configurations..."
  [ -e ~/.zshrc ] && mv -f ~/.zshrc ~/.dotBackups/$backupFolder/zsh
  [ -e ~/.oh-my-zsh/custom/aliases.zsh ] && mv -f ~/.oh-my-zsh/custom/aliases.zsh ~/.dotBackups/$backupFolder/zsh
  [ -e ~/.oh-my-zsh/custom/functions.zsh ] && mv -f ~/.oh-my-zsh/custom/functions.zsh ~/.dotBackups/$backupFolder/zsh
  [ -e ~/.oh-my-zsh/custom/themes/DomsTheme.zsh-theme ] && mv -f ~/.oh-my-zsh/custom/themes/DomsTheme.zsh-theme ~/.dotBackups/$backupFolder/zsh

  echo $GREEN$prefix"Backups have been saved to ~/"$backupRoot$backupFolder"/"$NOCOLOR

#-------------------------
#----- Install Tools -----
#-------------------------

# Install System Tools
  if [ $isInstall = "y" -o $isInstall = "Y" ]; then
      echo -e $YELLOW$prefix"Installing system tools..."$NOCOLOR

    #Install Oh-My-ZSH!
      if [ -e ~/.oh-my-zsh/oh-my-zsh.sh ]; then
        echo $prefix"Oh-My-Zsh is already installed"
      else
        echo $YELLOW$prefix"Installing Oh-My-Zsh"$NOCOLOR
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        needRestart=true
      fi

    sleep 0.5

    #Install Brew
      if type brew > /dev/null; then
        echo $prefix'Homebrew is already installed'
      else
        echo $YELLOW$prefix"Installing Homebrew"$NOCOLOR
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        needRestart=true
      fi

    sleep 0.5
    echo $GREEN$prefix"All dependencies successfully installed"$NOCOLOR
  fi

#-------------------------
#----- Upgrade Tools -----
#-------------------------

# Upgrade Tools
  echo -e $GREEN$prefix"Updating tools..."$NOCOLOR

  # Oh-My-Zsh
  if [ -e ~/.oh-my-zsh/tools/upgrade.sh ]; then
    zsh ~/.oh-my-zsh/tools/upgrade.sh
    echo $prefix"Oh-My-Zsh updated"
  fi

  sleep 0.5

  # Brew
  if type brew > /dev/null; then
    echo $prefix"Updating brew"
    brew update


    if $reducedInstall; then
      echo $prefix"Installing reduced brew plugins"
      zsh $resourceFolder/tools/brew.sh -r
    else
      echo $prefix"Installing full plugins"
      zsh $resourceFolder/tools/brew.sh
    fi


    echo $prefix"Updating brew plugins"
    brew upgrade

    echo $prefix"Cleaning outdated brew plugins"
    brew cleanup
  fi

  sleep 0.5

#-------------------------
#---- Setup Symlinks -----
#-------------------------

# Set Up Symlinks
  echo -e $GREEN$prefix"Setting up symlinks..."$NOCOLOR

  # SSH
  echo $prefix"Setting up ssh symlinks..."
  mkdir -p ~/.ssh
  ln -sf $resourceFolder/ssh/config ~/.ssh
  ln -sf $resourceFolder/ssh/known_hosts ~/.ssh
  ln -sf $resourceFolder/ssh/main_id_rsa ~/.ssh
  ln -sf $resourceFolder/ssh/main_id_rsa.pub ~/.ssh

  # Git
  echo $prefix"Setting up git symlinks..."
  ln -sf $resourceFolder/git/.gitconfig ~
  ln -sf $resourceFolder/git/.gitignore ~

  # Scripts
  echo $prefix"Setting up script symlinks..."
  mkdir -p ~/.scripts
  ln -sf $resourceFolder/scripts/BatCharge.py ~/.scripts
  ln -sf $resourceFolder/scripts/setTerminalTheme.scpt ~/.scripts
  ln -sf $resourceFolder/scripts/toggleDarkMode.scpt ~/.scripts

  # ZSH
  echo $prefix"Setting up zsh symlinks..."
  ln -sf $resourceFolder/zsh/.zshrc ~
  ln -sf $resourceFolder/zsh/aliases.zsh ~/.oh-my-zsh/custom
  ln -sf $resourceFolder/zsh/functions.zsh ~/.oh-my-zsh/custom
  ln -sf $resourceFolder/zsh/DomsTheme.zsh-theme ~/.oh-my-zsh/custom/themes

#-------------------------
#------- Finished --------
#-------------------------
  echo -e $GREEN$prefix"All done"$NOCOLOR

  # Restart machine if needed
  if $needRestart; then
    echo $RED$prefix"The system needs to reboot for some changes to take affect."
    read "doRestart?"$prefix"Would you like to do this now (y/n)? "

    if [ $doRestart = "y" -o $doRestart = "Y" ]; then
      echo $RED$prefix"Rebooting now..."$NOCOLOR
      sleep 1
      shutdown -r now
    else
      echo $YELLOW$prefix"Some changes won't take place until the machine has been restarted"$NOCOLOR
    fi
  fi
