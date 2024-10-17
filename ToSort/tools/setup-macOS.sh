#!/usr/bin/env zsh

# If install...
if [[ $installCode == 1 ]]; then
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
fi