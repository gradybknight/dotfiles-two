#!/bin/bash

# Fedora Dotfiles Setup Script
# This script sets up development environment on Fedora using symlinks

set -e  # Exit on any error

DOTFILES_DIR="$HOME/git/dotfiles"
FEDORA_DIR="$DOTFILES_DIR/fedora"
CONFIG_DIR="$HOME/.config"

echo "=== Fedora Dotfiles Setup ==="

# Ensure the dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: $DOTFILES_DIR does not exist. Clone your dotfiles repo first."
    exit 1
fi

if [ ! -d "$FEDORA_DIR" ]; then
    echo "Error: $FEDORA_DIR does not exist. Make sure you're using the updated dotfiles repo."
    exit 1
fi

# Ensure ~/.config exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Creating ~/.config directory..."
    mkdir -p "$CONFIG_DIR"
fi

echo "Installing required packages via DNF..."
sudo dnf update -y

# Install core packages (always needed)
sudo dnf install -y \
    neovim \
    tmux \
    git \
    stow \
    ripgrep \
    fzf \
    tree \
    jq \
    curl \
    wget \
    zsh \
    util-linux-user

# Check if nodejs is already installed
if ! command -v node &> /dev/null; then
    echo "Installing nodejs..."
    sudo dnf install -y nodejs npm
else
    echo "✓ Node.js already installed ($(node --version))"
fi

# Check if python3 is already installed  
if ! command -v python3 &> /dev/null; then
    echo "Installing python3..."
    sudo dnf install -y python3-pip
else
    echo "✓ Python3 already installed ($(python3 --version))"
fi

echo "Setting up ZSH as default shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "ZSH set as default shell. Please log out and back in for this to take effect."
fi

echo "Creating symlinks for configurations..."

# Symlink nvim configuration
if [ -L "$CONFIG_DIR/nvim" ]; then
    echo "Removing existing nvim symlink..."
    rm "$CONFIG_DIR/nvim"
elif [ -d "$CONFIG_DIR/nvim" ]; then
    echo "Backing up existing nvim config to nvim.backup..."
    mv "$CONFIG_DIR/nvim" "$CONFIG_DIR/nvim.backup"
fi
ln -sf "$FEDORA_DIR/nvim" "$CONFIG_DIR/nvim"
echo "✓ Symlinked nvim configuration"

# Symlink tmux configuration
if [ -L "$CONFIG_DIR/tmux" ]; then
    echo "Removing existing tmux symlink..."
    rm "$CONFIG_DIR/tmux"
elif [ -d "$CONFIG_DIR/tmux" ]; then
    echo "Backing up existing tmux config to tmux.backup..."
    mv "$CONFIG_DIR/tmux" "$CONFIG_DIR/tmux.backup"
fi
ln -sf "$FEDORA_DIR/tmux" "$CONFIG_DIR/tmux"
echo "✓ Symlinked tmux configuration"

# Setup tmux plugin manager
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    echo "Installing tmux plugin manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    echo "✓ TPM installed. Launch tmux and press Ctrl-A + I to install plugins"
else
    echo "✓ TPM already installed"
fi

# Setup zshrc if it exists in the dotfiles
ZSHRC_SOURCE="$DOTFILES_DIR/zshrc/.zshrc"
ZSHRC_TARGET="$HOME/.zshrc"
if [ -f "$ZSHRC_SOURCE" ]; then
    if [ -f "$ZSHRC_TARGET" ] && [ ! -L "$ZSHRC_TARGET" ]; then
        echo "Backing up existing .zshrc to .zshrc.backup..."
        mv "$ZSHRC_TARGET" "$HOME/.zshrc.backup"
    fi
    ln -sf "$ZSHRC_SOURCE" "$ZSHRC_TARGET"
    echo "✓ Symlinked .zshrc"
else
    echo "! No .zshrc found in dotfiles, skipping"
fi

# Install pure prompt for zsh
if [ ! -d "$HOME/.zsh" ]; then
    mkdir -p "$HOME/.zsh"
fi
if [ ! -d "$HOME/.zsh/pure" ]; then
    echo "Installing pure prompt..."
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
    echo "✓ Pure prompt installed"
else
    echo "✓ Pure prompt already installed"
fi

echo ""
echo "=== Setup Complete! ==="
echo ""
echo "Next steps:"
echo "1. Log out and back in (or restart terminal) to apply zsh as default shell"
echo "2. Start tmux and press Ctrl-A + I to install tmux plugins"
echo "3. Open nvim and let it install plugins automatically"
echo ""
echo "Optional:"
echo "- Install additional development tools as needed"
echo "- Configure git with your name and email:"
echo "  git config --global user.name \"Your Name\""
echo "  git config --global user.email \"your.email@example.com\""
echo ""