#!/usr/bin/env zsh

# Update $PATH
export PATH="$PATH":~/.scripts
export PATH="$PATH:/Users/dom/.local/bin"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

# Exports
export ITERM2_SQUELCH_MARK=1

# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit
if [ ! -d "$ZINIT_HOME" ]; then
    echo "Installing Zinit"
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
# zinit snippet OMZL::git.zsh
zinit snippet OMZP::dotenv
zinit snippet OMZP::poetry
zinit snippet OMZP::sudo

# Extras
source ~/.oh-my-zsh/custom/aliases.zsh
source ~/.oh-my-zsh/custom/functions.zsh

# Load autocompletions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Load Oh-My-Posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp.toml)"
fi

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Options
setopt correct
setopt complete_aliases
setopt hash_list_all
setopt menu_complete
setopt auto_cd
setopt auto_pushd
setopt chase_links
setopt pushd_silent
setopt pushd_to_home

# Shell integrations
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

