# Ideas
- Sync Sublime settings
- Fix asdf-prompt-info
- Consider: laxydocker https://github.com/jesseduffield/lazydocker
- Consider: iTerm https://iterm2.com/

# setup-macos.sh
- Check if install, update, or relink
- If install:
  - Install Xcode Command Line Tools `xcode-select --install`
  - Set MacOS System Preferences https://github.com/kevinSuttle/macOS-Defaults
  - Ensure using zsh https://linuxhint.com/know-bash-or-zsh/
  - Optional: Generate ssh keys https://github.com/driesvints/dotfiles/blob/main/ssh.sh
  - Install oh-my-zsh
  - Install homebrew
    - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)”`
  - Install development environments
    - asdf
      - `git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0`
      - `asdf update`
    - python
      - `asdf plugin add python`
      - `asdf install python 3.10.4`
      - `asdf global python 3.10.4`
    - pipx
      - `brew install pipx`
      - `pipx ensurepath`
    - pipenv
      - `pipx install pipenv`
    - nodejs
      - `asdf plugin add nodejs`
      - `asdf install nodejs lts`
      - `asdf global nodejs lts`
    - ruby
      - `asdf plugin add ruby`
      - `asdf install ruby latest`
      - `asdf global ruby latest`
- If install or update:
  - Disable brew analytics
  - Update oh-my-zsh
  - Update homebrew
  - Update brew plugins
- If install:
  - Install brew plugins
    - Global `brew-global.sh`
    - Host specific `brew-hostname.sh`
- If install or update:
  - Clean outdated brew plugins
- If install, update, or relink:
  - Build symlinks
    - sublime
    - git
    - scripts (copy all contents)
    - ssh
    - zsh (copy all plugins)
    - .hushlogin
    - .screenrc
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
    - Set MacOS Dock
      - Host specific

# brew-global.sh
- brew
  - git
  - git-filter-repo
  - FFmpeg
- brew-cask
  -

# brew-Doms-Mac-Mini
- youtube-dl

# setup.sh
- If MacOS - `if [[ "$OSTYPE" == "darwin"* ]]; then ... ; fi`
  - exec setup-macos.sh
