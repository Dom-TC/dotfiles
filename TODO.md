# Ideas
- Sync atom plugins.  Submodules?  `apm list --installed --bare > ~/.atom/package.list` and `apm install --packages-file ~/.atom/package.list`

# setup.sh
- Check if install, update, or relink
- If install:
  - Install Xcode Command Line Tools `xcode-select --install`
  - Set MacOS System Preferences
  - Ensure using zsh
  - Optional: Generate ssh keys https://github.com/driesvints/dotfiles/blob/main/ssh.sh
  - Install oh-my-zsh
  - Install homebrew - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)”`
- If install or update:
  - Disable brew analytics
  - Update oh-my-zsh
  - Update homebrew
- If install:
  - Install brew plugins
    - Global `brew-global.sh`
    - Host specific `brew-hostname.sh`
  - Setup Python environment
- If install or update:
  - Update brew plugins
  - Clean outdated brew plugins
- If install, update, or relink:
  - Build symlinks
    - atom
    - git
    - scripts (copy all contents)
    - ssh
    - zsh (copy all plugins)
- If install:
  - Install fonts https://github.com/powerline/fonts/blob/master/install.sh
    - Equity
    - Triplicate
    - Concourse
    - Advocate
    - Inconsolata
    - DinPro
    - Raleway
  - Install terminal themes
  - Print list of uninstalled, suggested apps

# brew-global.sh
- brew
  - pyenv
  - pyenv-virtualenv
  - zlib
  - sqlite
  - git-filter-repo
  - FFmpeg
- brew-cask
  -

# brew-Doms-Mac-Mini
- youtube-dl
