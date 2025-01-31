#!/usr/bin/env zsh

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')" || return
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
if [ ! "$(uname -s)" = 'Darwin' ]; then
    if grep -q Microsoft /proc/version; then
        # Ubuntu on Windows using the Linux subsystem
        alias open='explorer.exe';
    else
        alias open='xdg-open';
    fi
fi

# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$@" || return
}

# Open man pages in new tab
function man() {
    open x-man-page://"$*" ;
}

# Check if a command exists, can be a binary in PATH or a shell
# alias/function.
# Use as:
# if has cd; then ...; fi
function has() {
    type "$1" &>/dev/null
}

# Where is a function defined?
whichfunc() {
    whence -v "$1"
    type -a "$1"
}

# Change Dark Mode
function go_dark() {
    if has toggleDarkMode; then
        toggleDarkMode dark
    fi
}

function go_light() {
    if has toggleDarkMode; then
        toggleDarkMode light
    fi
}
