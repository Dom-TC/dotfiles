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