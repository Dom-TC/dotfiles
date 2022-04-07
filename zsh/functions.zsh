#!/usr/bin/env bash

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# `o` with no arguments opens the current directory, otherwise opens the given location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# Normalize `open` across Linux, macOS, and Windows.
# This is needed to make the `o` function (see below) cross-platform.
if [ ! $(uname -s) = 'Darwin' ]; then
	if grep -q Microsoft /proc/version; then
		# Ubuntu on Windows using the Linux subsystem
		alias open='explorer.exe';
	else
		alias open='xdg-open';
	fi
fi

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

# Open man pages in new tab
function man() {
	open x-man-page://$@ ;
}


# Change Dark Mode
function goDark() {
  if [ -e ~/.scripts/toggleDarkMode.scpt ]
  then
      osascript ~/.scripts/toggleDarkMode.scpt dark
			if [ -e ~/.scripts/setTerminalTheme.scpt ]
			then
					osascript ~/.scripts/setTerminalTheme.scpt "Solarized Light" "Solarized Dark"
			fi
  fi
}

function goLight() {
  if [ -e ~/.scripts/toggleDarkMode.scpt ]
  then
      osascript ~/.scripts/toggleDarkMode.scpt light
			if [ -e ~/.scripts/setTerminalTheme.scpt ]
			then
					osascript ~/.scripts/setTerminalTheme.scpt "Solarized Light" "Solarized Dark"
			fi
  fi
}
