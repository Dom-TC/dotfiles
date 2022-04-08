# Ideas
- Add MacOS System Preferences
- Consider Mackup
- Rewrite brew.sh as proper brew file
- Rewrite setup.sh
    - Consider separating update parts into update.sh
- Allow for different customisations by hostname
- Sync atom plugins

# Setup.sh
- Install Xcode Command Line Tools `xcode-select --install`
- Ensure using zsh
- Optional: Generate ssh keys https://github.com/driesvints/dotfiles/blob/main/ssh.sh
- Install oh-my-zsh
- Install homebrew - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)”`
- Disable brew analytics
- Update oh-my-zsh
- Update homebrew
- Install brew plugins
  - Global
  - Host specific
- Update brew plugins
- Clean outdated brew plugins
- Build symlinks
  - atom
  - git
  - scripts (copy all contents)
  - ssh
  - zsh (copy all plugins)
- Install fonts
