#!/usr/bin/env zsh

#-------------------------
#------- Variables -------
#-------------------------

# Command Prefix
prefix="[MacOS-Settings] "

# Colours
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NOCOLOR="\033[0m"

#-------------------------
#------- Functions -------
#-------------------------

#-------------------------
#--------- MAIN ----------
#-------------------------


# Based off of https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos

echo $YELLOW$prefix"Closing System Preferences"$NOCOLOR
osascript -e 'tell application "System Preferences" to quit'

# Disable Drive Ejection Warning
echo $NOCOLOR$prefix"Disabling drive ejection warnings"$NOCOLOR
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd
