#Add folders to $PATH
export PATH="$PATH":~/.scripts
export PATH="$PATH:/Users/dom/.local/bin"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

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
source ~/scripts/z/z.sh

# Enable pipx autocompletions
if has pipx; then
    autoload -U bashcompinit
    bashcompinit
    eval "$(register-python-argcomplete pipx)"
fi

# Enable suggested corrections
setopt CORRECT
setopt CORRECT_ALL
