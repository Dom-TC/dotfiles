# My Dotfiles

I've recently switched to managing my dotfiles with Chezmoi. This is still very much an experiment to see how I like it.

## Installation

1. Install 1Password
2. Active 1Password SSH Agent (`Settings>Developer>Use the SSH Agent`)
3. `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply dom-tc`

## To Do

- Consider asdf-direnv
- Move to XDG_BASE_DIR - See: https://wiki.archlinux.org/index.php/XDG_Base_Directory
- Implement solution to set .chezmoi.toml data
  - Ask questions on run?
  - Environment variables?
- Set MacOS settings
  - Customise dock?
- Prettify script output
- Add pipx completions
- Set `HOMEBREW_NO_ENV_HINTS` to true as part of homebrew install to tidy output
- Install / activate tailscale
- Automatically set iterm to use synced settings

## Credit

I took inspiration from a lot of dotfiles repos, especially during the process of moving to Chezmoi, but special thanks to the following:

- https://github.com/barrydobson/dotfiles/
- https://github.com/natelandau/dotfiles/
- https://github.com/barrucadu/dotfiles/
