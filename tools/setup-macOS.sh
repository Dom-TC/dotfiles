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
  gitFolder=$dotFolder"/git"
  scriptsFolder=$dotFolder"/scripts"
  sshFolder=$dotFolder"/ssh"
  toolsFolder=$dotFolder"/tools"
  zshFolder=$dotFolder"/zsh"

  backupRoot=".dotBackups/"
  backupFolder=$(date +"%Y-%m-%d_%H%M%S")

# General
  email="dom.chester@me.com"
  hostname_full=$(hostname)
  hostname=${hostname_full//.local/}

# Initialise Variables
  installCode=0
  generateSSH=0
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
    echo $YELLOW
    echo $prefix"Would you like to:"
    echo $prefix"1 - Install"
    echo $prefix"2 - Update"
    echo $prefix"3 - Relink"
    read "installCode?"$prefix"Please pick an option: "

    if [[ $installCode != 1 && $installCode != 2 && $installCode != 3 ]]; then
      echo $RED$prefix"Please pick an option from 1–3"
    fi
  done

#-------------------------
#----- Installation ------
#-------------------------

# If install...
  if [[ $installCode == 1 ]]; then
    echo $GREEN$prefix"Installing system tools"$NOCOLOR

    # Set default terminal
    echo $NOCOLOR$prefix"Ensure zsh is default terminal"$NOCOLOR
    chsh -s /usr/local/bin/zsh

    # Install Xcode Command Line Tools
    if has xcode-select; then
      echo $prefix"xcode-select is already installed.  Skipping..."
    else
      echo $prefix"Installing xcode-select"
      xcode-select --install
    fi

    # Set global MacOS defaults
    echo $NOCOLOR$prefix"Setting MacOS defaults"$NOCOLOR
    zsh $toolsFolder/macos-settings-global.sh

    # Install host-specific brew formulae
    if [ -e $toolsFolder/macos-settings-$hostname.sh ]; then
      echo $NOCOLOR$prefix"Setting host-specific MacOS settings"$NOCOLOR
      zsh $toolsFolder/macos-settings-$hostname.sh
    else
      echo $YELLOW$prefix"No host-specific MacOS settings file provided"$NOCOLOR
   fi

    # Generate SSH keys
    while [[ $generateSSH != "Y" && $generateSSH != "y" && $generateSSH != "N" && $generateSSH != "n" ]]; do
      echo $YELLOW
      read "generateSSH?"$prefix"Would you like to generate a SSH key? (Y/N): "

      if [[ $generateSSH != "Y" && $generateSSH != "y" && $generateSSH != "N" && $generateSSH != "n" ]]; then
        echo $RED$prefix"Please select Y or N"
      fi
    done

    if [[ $generateSSH == "Y" || $generateSSH == "y" ]]; then
      echo $NOCOLOR$prefix"Generating SSH key"$NOCOLOR
      ssh-keygen -t ed25519 -C $email -f ~/.ssh/id_ed25519
      eval "$(ssh-agent -s)"
      ssh-add -K ~/.ssh/id_ed25519

      echo $YELLOW$prefix"Run 'pbcopy < ~/.ssh/id_ed25519.pub' to get public key"$NOCOLOR
    fi

    # Install oh-my-zsh
    if [ -e ~/.oh-my-zsh/oh-my-zsh.sh ]; then
      echo $NOCOLOR$prefix"Oh-My-Zsh is already installed.  Skipping..."
    else
      echo $NOCOLOR$prefix"Installing Oh-My-Zsh"$NOCOLOR
      sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
      needRestart=true
    fi

    # Install homebrew
    if has brew; then 
      echo $NOCOLOR$prefix"Homebrew is already installed.  Skipping..."$NOCOLOR
    else
      echo $NOCOLOR$prefix"Installing Homebrew"$NOCOLOR
      NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      brew analytics off
    fi  

    # Install development environments
      # asdf
      if has asdf; then
        echo $NOCOLOR$prefix"asdf is already installed.  Skipping..."$NOCOLOR
      else
        echo $NOCOLOR$prefix"Installing asdf"$NOCOLOR
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
        asdf update
      fi

      # python
      echo $NOCOLOR$prefix"Installing python asdf plugin"$NOCOLOR
      asdf plugin add python
      asdf install python latest
      asdf global python latest

      # nodejs
      echo $NOCOLOR$prefix"Installing nodejs asdf plugin"$NOCOLOR
      asdf plugin add nodejs
      asdf install nodejs latest
      asdf global nodejs latest

      # ruby
      echo $NOCOLOR$prefix"Installing ruby asdf plugin"$NOCOLOR
      asdf plugin add ruby
      asdf install ruby latest
      asdf global ruby latest

      # pipx
      if has pipx; then 
        echo $NOCOLOR$prefix"Pipx is already installed.  Skipping..."$NOCOLOR
      else
        echo $NOCOLOR$prefix"Installing pipx"$NOCOLOR
        brew install pipx
        pipx ensurepath
      fi
      
      # poetry 
      if has poetry; then 
        echo $NOCOLOR$prefix"Poetry is already installed.  Skipping..."$NOCOLOR
      else
        echo $NOCOLOR$prefix"Installing poetry"$NOCOLOR
        curl -sSL https://install.python-poetry.org | python3 -
        poetry self update
        mkdir $ZSH_CUSTOM/plugins/poetry
        poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
      fi
  fi

  # If update...
  if [[ $installCode == 2 ]]; then
    echo $GREEN$prefix"Updating system tools"$NOCOLOR

    # Update oh-my-zsh
    if [ -e ~/.oh-my-zsh/tools/upgrade.sh ]; then
      echo $NOCOLOR$prefix"Updating oh-my-zsh"$NOCOLOR
      zsh ~/.oh-my-zsh/tools/upgrade.sh
    fi

    # Update homebrew
    echo $NOCOLOR$prefix"Updating homebrew"$NOCOLOR
    brew update
    echo $NOCOLOR$prefix"Updating homebrew formulae"$NOCOLOR
    brew upgrade

    # Update asdf
    echo $NOCOLOR$prefix"Updating asdf"$NOCOLOR
    asdf update

    # Update python
    echo $NOCOLOR$prefix"Updating python asdf plugin"$NOCOLOR
    asdf plugin update python
    asdf install python latest
    asdf global python latest

    # nodejs
    echo $NOCOLOR$prefix"Updating nodejs asdf plugin"$NOCOLOR
    asdf plugin update nodejs
    asdf install nodejs latest
    asdf global nodejs latest

    # ruby
    echo $NOCOLOR$prefix"Updating ruby asdf plugin"$NOCOLOR
    asdf plugin update ruby
    asdf install ruby latest
    asdf global ruby latest

    # Update poetry
    echo $NOCOLOR$prefix"Updating poetry"$NOCOLOR
    poetry self update
  fi

  # If install or update...
  if [[ $installCode == 1 || $installCode == 2 ]]; then
    # Install global brew formulae
    echo $NOCOLOR$prefix"Installing global brew formulae"$NOCOLOR
    zsh $toolsFolder/brew-global.sh

    # Install host-specific brew formulae
    if [ -e $toolsFolder/brew-$hostname.sh ]; then
      echo $NOCOLOR$prefix"Installing host-specific brew formulae"$NOCOLOR
      zsh $toolsFolder/brew-$hostname.sh
    else
      echo $YELLOW$prefix"No host-specific brew file provided"$NOCOLOR
   fi

    # Clean outdated brew plugins
    echo $NOCOLOR$prefix"Cleaning up brew"$NOCOLOR
    brew cleanup
  fi

  # If install, update or relink...
  if [[ $installCode == 1 || $installCode == 2 || $installCode == 3 ]]; then
    # Build symlinks
      # git
      echo $NOCOLOR$prefix"Creating git symlinks"$NOCOLOR
      ln -sf $gitFolder/.gitconfig ~
      ln -sf $gitFolder/.gitignore ~

      # ssh
      echo $NOCOLOR$prefix"Creating ssh symlinks"$NOCOLOR
      mkdir -p ~/.ssh
      ln -sf $sshFolder/config ~/.ssh

      # zsh
      echo $NOCOLOR$prefix"Creating zsh symlinks"$NOCOLOR
      ln -sf $zshFolder/.zshrc ~
      ln -sf $zshFolder/aliases.zsh ~/.oh-my-zsh/custom
      ln -sf $zshFolder/functions.zsh ~/.oh-my-zsh/custom
      ln -sf $zshFolder/DomsTheme.zsh-theme ~/.oh-my-zsh/custom/themes
      for plugin in $zshFolder/plugins/*; do 
        ln -sf $plugin ~/.oh-my-zsh/custom/plugins
      done 

      # scripts
      echo $NOCOLOR$prefix"Creating scripts symlinks"$NOCOLOR
      for script in $scriptsFolder/*; do 
        ln -sf $script ~/.scripts
      done 

      # other
      echo $NOCOLOR$prefix"Creating remaining symlinks"$NOCOLOR
      ln -sf $dotFolder/.hushlogin ~
      ln -sf $dotFolder/.screenrc ~
  fi
