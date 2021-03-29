# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.


# General
alias cls='clear'
alias '?=man'
alias sudo='sudo '
alias !='sudo'
alias '?'='status'

# Shortcuts
alias projects='cd ~/Dropbox/1\ Projects'
alias areas='cd ~/Dropbox/2\ Areas'
alias resources='cd ~/Dropbox/3\ Resources'
alias archive='cd ~/Dropbox/4\ Archive'
alias dotfiles='cd ~/Dropbox/3\ Resource/Libraries/dotfiles'

# Show/hide hidden files in Finder
alias showFiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hideFiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Python
alias py='/usr/local/bin/python3'
