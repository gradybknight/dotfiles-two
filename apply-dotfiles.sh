#!/bin/bash

# Set the base directory where the dotfiles repo is cloned
DOTFILES_DIR="$HOME/git/dotfiles"

# Ensure the dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: $DOTFILES_DIR does not exist. Clone your dotfiles repo first."
    exit 1
fi

# Ensure ~/.config exists
CONFIG_DIR="$HOME/.config"
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Creating ~/.config directory..."
    mkdir -p "$CONFIG_DIR"
fi

# List of directories to stow
DIRS=("aerospace" "alacrity" "nvim" "tux" "zshrc")

# Use GNU stow to symlink each directory
echo "Applying dotfiles using stow..."
for dir in "${DIRS[@]}"; do
    TARGET_DIR="$DOTFILES_DIR/$dir"
    if [ -d "$TARGET_DIR" ]; then
        echo "Stowing $dir..."
        stow --dir="$DOTFILES_DIR" --target="$CONFIG_DIR" "$dir"
    else
        echo "Warning: $dir does not exist in $DOTFILES_DIR. Skipping."
    fi
done

echo "Dotfiles successfully applied!"

