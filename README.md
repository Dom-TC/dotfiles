# My Dotfiles

I've recently switched to managing my dotfiles with Chezmoi. This is still very much an experiment to see how I like it.

## Installation

1. Install 1Password
2. Active 1Password SSH Agent (`Settings>Developer>Use the SSH Agent`)
3. `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply dom-tc` This may require running twice if git isn't already installed.

## To Do

- Consider asdf-direnv
- Move to XDG_BASE_DIR - See: <https://wiki.archlinux.org/index.php/XDG_Base_Directory>
- Implement solution to set .chezmoi.toml data
  - Ask questions on run?
  - Environment variables?
- Prettify script output - See: <https://github.com/natelandau/dotfiles/blob/master/dotfiles/.chezmoitemplates/shared_script_utils.bash>
- Activate tailscale
- Install Applications
  - VectorWorks
  - DVS
  - Dante Controller
  - WWB
  - CleanShot X
  - Veija
  - Lasso
  - Smaart
  - IP Scanner
  - Wifi Scanner Pro
  - Hazel
  - Teams
- Setup Mail Accounts
- Create VS Code extension to automatacially update list when extensions are installed
- Pass password into scripts to avoid repeat password requests?
- Temp install git to avoid erroring while waiting for XCode tooling to install?
- Post install steps?
  - Any manual steps that need completing
  - Log into accounts
  - Activate Safari extensions
  - etc.

## Credit

I took inspiration from a lot of dotfiles repos, especially during the process of moving to Chezmoi, but special thanks to the following:

- <https://github.com/barrydobson/dotfiles/>
- <https://github.com/natelandau/dotfiles/>
- <https://github.com/barrucadu/dotfiles/>
