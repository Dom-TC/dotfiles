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
fi