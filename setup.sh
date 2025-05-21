#!/bin/bash

export XDG_CONFIG_HOME="$HOME"/.config

# Create necessary directories
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CONFIG_HOME"/nixpkgs
mkdir -p "$XDG_CONFIG_HOME"/.tmux
mkdir -p "$XDG_CONFIG_HOME"/.tmux/plugins

# Create symbolic links
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim
ln -sf "$PWD/tmux" "$XDG_CONFIG_HOME"/tmux
# ln -sf "$PWD/tmux/tmux.conf" "$XDG_CONFIG_HOME"/.tmux.conf
# ln -sf "$PWD/tmux/tmux.reset.conf" "$XDG_CONFIG_HOME"/tmux/tmux.reset.conf
ln -sf "$PWD/config.nix" "$XDG_CONFIG_HOME"/nixpkgs/config.nix

# Check if TPM (tmux plugin manager) is already installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Cloning tmux plugin manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    echo "TPM already installed at $HOME/.tmux/plugins/tpm"
fi

# Install Nix packages
nix-env -iA nixpkgs.myPackages


