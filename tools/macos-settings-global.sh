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


# Inspired by:
# - https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos
# - https://github.com/vendasta/setup-new-computer-script

echo $YELLOW$prefix"Closing System Preferences"$NOCOLOR
osascript -e 'tell application "System Preferences" to quit'

#-------------------------
#-------- General --------
#-------------------------

# Disable Drive Ejection Warning
echo $NOCOLOR$prefix"Disabling drive ejection warnings"$NOCOLOR
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd

# Expand save and print dialogs by default
echo $NOCOLOR$prefix"Expand save and print dialogs"$NOCOLOR
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk, not icloud by default
echo $NOCOLOR$prefix"Save to disk by default"$NOCOLOR
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Avoid creating .DS_Store on network volume
echo $NOCOLOR$prefix"Disable network .DS_Store files"$NOCOLOR
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#-------------------------
#-------- Safari ---------
#-------------------------

# Enable Safari developer settings
echo $NOCOLOR$prefix"Enable Safari developer settings"$NOCOLOR
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


