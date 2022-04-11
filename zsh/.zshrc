#Add folders to $PATH
PATH="$PATH":~/.scripts
export PATH

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
)

source $ZSH/oh-my-zsh.sh

# Enable suggested corrections
setopt CORRECT
setopt CORRECT_ALL
