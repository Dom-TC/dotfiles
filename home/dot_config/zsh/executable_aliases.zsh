#!/usr/bin/env zsh

# General
alias cls='clear'
alias '?=man'
alias !='sudo'
alias '?'='status'
alias py='python3'
alias python='python3'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Shortcuts
alias projects='cd ~/Dropbox/1\ Projects'
alias areas='cd ~/Dropbox/2\ Areas'
alias notes='cd ~/Dropbox/3\ Notes'
alias archive='cd ~/Dropbox/4\ Archive'
alias cdd="cd ~/Desktop"

# Show/hide hidden files in Finder
alias showFiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Commands
alias reload='exec zsh'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
    export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
    colorflag="-G"
    export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l='ls -lF ${colorflag}'

# List all files colorized in long format, excluding . and ..
alias la='ls -lAF ${colorflag}'

# List only directories
alias lsd='ls -lF ${colorflag} | grep --color=never '^d''

# Always use color output for `ls`
alias ls='command ls ${colorflag}'

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Open directory / file in vscode
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias tower='open -a "Tower" '

# Alias mkd back to mkcd incase anything is still using it
alias mkd='mkcd'