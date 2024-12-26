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

# Reload terminal
alias reload='exec zsh'

# Use eza inplace of ls
alias ls='eza --icons --group-directories-first'
alias la='eza --icons --group-directories-first -la'
alias lsd='eza --icons --group-directories-first -lD'
alias tree='eza --tree --icons --group-directories-first -a'

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