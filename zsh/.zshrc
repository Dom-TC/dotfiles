#Add folders to $PATH
PATH="$PATH":~/.scripts
export PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/dom/.oh-my-zsh"

# Theme Name
ZSH_THEME="DomsTheme"

# Load plugins
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Set Python Environment Variable
export VIRTUALENVWRAPPER_PYTHON=~/.pyenv/versions/3.9.2/bin/python3.9
export VIRTUALENVWRAPPER_VIRTUALENV=~/.pyenv/versions/3.9.2/bin/virtualenv

if has pyenv; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  export VIRTUAL_ENV_DISABLE_PROMPT=1
  export PIPENV_VERBOSITY=-1

fi

# Set up Python Virtual Environments
source ~/.pyenv/versions/3.9.2/bin/virtualenvwrapper.sh

# Enable suggested corrections
setopt CORRECT
setopt CORRECT_ALL
