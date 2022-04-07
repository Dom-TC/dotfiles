#Add folders to $PATH
path+=('~/.scripts')
export PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/dom/.oh-my-zsh"

# Theme Name
ZSH_THEME="DomsTheme"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Set Python Environment Variable
export VIRTUALENVWRAPPER_PYTHON=~/.pyenv/versions/3.9.2/bin/python3.9
export VIRTUALENVWRAPPER_VIRTUALENV=~/.pyenv/versions/3.9.2/bin/virtualenv

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  export PYENV_VIRTUALENV_DISABLE_PROMPT=1
  export VIRTUAL_ENV_DISABLE_PROMPT=1
  export PIPENV_VERBOSITY=-1

fi


# Set up Python Virtual Environments
source ~/.pyenv/versions/3.9.2/bin/virtualenvwrapper.sh

# User configuration

# Enable suggested corrections
setopt CORRECT
setopt CORRECT_ALL

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
