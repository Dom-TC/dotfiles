#Add folders to $PATH
export PATH="$PATH":~/.scripts
export PATH="$PATH:/Users/dom/.local/bin"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export ITERM2_SQUELCH_MARK=1

# Path to your oh-my-zsh installation.
export ZSH="/Users/dom/.oh-my-zsh"

# Theme Name
ZSH_THEME="DomsTheme"

# Load plugins
plugins=(
    git
    zsh-syntax-highlighting
    asdf
    zsh-asdf-prompt
    dotenv
    poetry
)

source $ZSH/oh-my-zsh.sh
source ~/.scripts/z/z.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable pipx autocompletions
if has pipx; then
    autoload -U bashcompinit
    bashcompinit
    eval "$(register-python-argcomplete pipx)"
fi

# Enable suggested corrections
setopt CORRECT
setopt CORRECT_ALL

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

