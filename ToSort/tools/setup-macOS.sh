#!/usr/bin/env zsh

#-------------------------
#------- Variables -------
#-------------------------

# Command Prefix
prefix="[Dot-Setup-MacOS] "

# Colours
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

# Folder Location
dotFolder=$HOME"/dotfiles"
toolsFolder=$dotFolder"/tools"

# General
hostname_full=$(hostname)
hostname=${hostname_full//.local/}

# Initialise Variables
installCode=0
setMacDefaults=0

#-------------------------
#------- Functions -------
#-------------------------

# Check if a command exists, can be a binary in PATH or a shell
function has() {
    type $1 &>/dev/null
}

#-------------------------
#----- Installation ------
#-------------------------

# If install...
if [[ $installCode == 1 ]]; then
    echo $GREEN$prefix"Installing system tools"$NOCOLOR

    # Set default shell to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        echo $NOCOLOR$prefix"Setting default shell to zsh"$NOCOLOR
        chsh -s $(which zsh)
    fi

    # Install Xcode Command Line Tools
    echo $NOCOLOR$prefix"Installing xcode-select"$NOCOLOR
    xcode-select --install

    # If M-series chip...
    if [[ $CPUTYPE == arm64 ]]; then
        echo $NOCOLOR$prefix"Installing rosetta"$NOCOLOR
        softwareupdate --install-rosetta --agree-to-license
    else
        echo $NOCOLOR$prefix"Mac has an intel chip.  Rosetta not needed.  Skipping..."$NOCOLOR
    fi

    # Set MacOS defaults preferences
    while [[ $setMacDefaults =~ [^YyNn] ]]; do
        echo $YELLOW
        read "setMacDefaults?"$prefix"Would you like to set default MacOS preferences? (Y/N): "

        if [[ $setMacDefaults =~ [^YyNn] ]]; then
            echo $RED$prefix"Please select Y or N"
        fi
    done

    if [[ $setMacDefaults =~ [Yy] ]]; then
        # Set global MacOS default preferences
        echo $NOCOLOR$prefix"Setting MacOS defaults"$NOCOLOR
        zsh $toolsFolder/macos-settings-global.sh

        # Install host-specific MacOS default preferences
        if [ -e $toolsFolder/macos-settings-$hostname.sh ]; then
            echo $NOCOLOR$prefix"Setting host-specific MacOS settings"$NOCOLOR
            zsh $toolsFolder/macos-settings-$hostname.sh
        else
            echo $YELLOW$prefix"No host-specific MacOS settings file provided"$NOCOLOR
        fi
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
        . $HOME/.asdf/asdf.sh
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

    # go
    echo $NOCOLOR$prefix"Installing go asdf plugin"$NOCOLOR
    asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
    asdf install golang latest
    asdf global golang latest

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
        poetry self update --preview
        mkdir $ZSH_CUSTOM/plugins/poetry
        poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
    fi

    # poetry-dynamic-versioning-plugin
    echo $NOCOLOR$prefix"Installing poetry-dynamic-versioning-plugin poetry plugin"$NOCOLOR
    poetry self add poetry-dynamic-versioning-plugin

    # pre-commit
    if has pre-commit; then
        echo $NOCOLOR$prefix"Pre-commit is already installed.  Skipping..."$NOCOLOR
    else
        echo $NOCOLOR$prefix"Installing pre-commit"$NOCOLOR
        pipx install pre-commit
    fi

    # Hugo
    if has hugo; then
        echo $NOCOLOR$prefix"Hugo is already installed.  Skipping..."$NOCOLOR
    else
        echo $NOCOLOR$prefix"Installing hugo"$NOCOLOR
        brew install hugo
    fi
fi

# If update...
if [[ $installCode == 2 ]]; then
    echo $GREEN$prefix"Updating system tools"$NOCOLOR

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
