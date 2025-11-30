#!/bin/bash

set -e  # Exit on error

echo "=== Dotfiles Installation Script ==="
echo ""

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Dotfiles directory: $DOTFILES_DIR"
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✓ Homebrew is already installed"
fi
echo ""

# Install required packages
echo "Checking for required packages..."
PACKAGES=("zsh" "neovim" "tmux")

for package in "${PACKAGES[@]}"; do
    if brew list "$package" &>/dev/null; then
        echo "✓ $package is already installed"
    else
        echo "Installing $package..."
        brew install "$package"
    fi
done
echo ""

# Set up config directories
export XDG_CONFIG_HOME="$HOME/.config"
echo "Creating config directories..."
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$HOME/.tmux/plugins"
echo "✓ Config directories created"
echo ""

# Create symbolic links for dotfiles
echo "Setting up dotfile symlinks..."

# Neovim
if [ -L "$XDG_CONFIG_HOME/nvim" ] && [ "$(readlink "$XDG_CONFIG_HOME/nvim")" = "$DOTFILES_DIR/nvim" ]; then
    echo "✓ nvim config already linked correctly"
elif [ -e "$XDG_CONFIG_HOME/nvim" ] && [ ! -L "$XDG_CONFIG_HOME/nvim" ]; then
    echo "Warning: $XDG_CONFIG_HOME/nvim exists and is not a symlink"
    echo "Please backup and remove it manually, then re-run this script"
else
    ln -sf "$DOTFILES_DIR/nvim" "$XDG_CONFIG_HOME/nvim"
    echo "✓ Linked nvim config"
fi

# Tmux
if [ -L "$XDG_CONFIG_HOME/tmux" ] && [ "$(readlink "$XDG_CONFIG_HOME/tmux")" = "$DOTFILES_DIR/tmux" ]; then
    echo "✓ tmux config already linked correctly"
elif [ -e "$XDG_CONFIG_HOME/tmux" ] && [ ! -L "$XDG_CONFIG_HOME/tmux" ]; then
    echo "Warning: $XDG_CONFIG_HOME/tmux exists and is not a symlink"
    echo "Please backup and remove it manually, then re-run this script"
else
    ln -sf "$DOTFILES_DIR/tmux" "$XDG_CONFIG_HOME/tmux"
    echo "✓ Linked tmux config"
fi

# Zsh
if [ -L "$HOME/.zshrc" ] && [ "$(readlink "$HOME/.zshrc")" = "$DOTFILES_DIR/zshrc/.zshrc" ]; then
    echo "✓ .zshrc already linked correctly"
elif [ -e "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "Warning: $HOME/.zshrc exists and is not a symlink"
    read -p "Backup existing .zshrc to .zshrc.backup? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
        ln -sf "$DOTFILES_DIR/zshrc/.zshrc" "$HOME/.zshrc"
        echo "✓ Backed up and linked .zshrc"
    else
        echo "Skipping .zshrc symlink"
    fi
else
    ln -sf "$DOTFILES_DIR/zshrc/.zshrc" "$HOME/.zshrc"
    echo "✓ Linked .zshrc"
fi
echo ""

# Install tmux plugin manager (TPM)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing tmux plugin manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    echo "✓ TPM installed"
else
    echo "✓ TPM already installed"
fi
echo ""

echo "=== Installation Complete! ==="
echo ""
echo "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Open tmux and press 'prefix + I' (default: Ctrl-b + I) to install tmux plugins"
echo "3. Open nvim - plugins will be installed automatically via lazy.nvim"
echo ""
