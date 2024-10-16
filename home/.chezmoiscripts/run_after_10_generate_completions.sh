#!/usr/bin/env bash

function has() {
    type "$1" &>/dev/null
}

if has docker; then
    docker completion zsh > ~/.config/zsh/completions/_docker
fi

if has chezmoi; then
    chezmoi completion zsh --output=~/.config/zsh/completions/_chezmoi
fi

if has poetry; then
    poetry completions zsh > ~/.config/zsh/completions/_poetry
fi

if has tailscale; then
    tailscale completion zsh > ~/.config/zsh/completions/_tailscale
fi