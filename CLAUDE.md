# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for managing development environment configurations across macOS and planned Fedora systems. The repository uses a hybrid approach with Nix Darwin for macOS system packages and Stow for symlinking configuration files.

## Setup Commands

### Initial System Setup (macOS)
```bash
# Clone repository
git clone https://github.com/gradybknight/dotfiles-two.git ~/git/dotfiles

# Install Nix (follow official instructions)
# Apply nix-darwin flake
nix run nix-darwin -- switch --flake ~/git/dotfiles/nix-darwin

# Apply dotfiles using stow
chmod +x ~/git/dotfiles/apply-dotfiles.sh
~/git/dotfiles/apply-dotfiles.sh

# Setup tmux plugins manually
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# In tmux: Ctrl-A then I
```

### Common Development Commands
```bash
# Update dotfiles symlinks
update  # alias for ~/git/dotfiles/apply-dotfiles.sh

# Rebuild nix-darwin configuration
rebuild  # alias for darwin-rebuild switch --flake ~/git/dotfiles/nix-darwin

# Navigate to dotfiles directory
dot  # alias for cd ~/git/dotfiles/

# DevPod setup with dotfiles
dpb  # alias for devpod up with dotfiles integration
```

## Architecture

### Package Management Strategy
- **Nix Darwin** (`nix-darwin/flake.nix`): System-level packages, macOS settings, Homebrew casks
- **Legacy Nix** (`config.nix`): Alternative package definition (less preferred)
- **Homebrew**: GUI applications and tools not available in Nix
- **Stow**: Symlink management for configuration files

### Configuration Structure
```
├── aerospace/          # Window manager config (macOS)
├── alacritty/         # Terminal emulator config
├── nvim/              # Neovim configuration (Lua-based)
├── tmux/              # Terminal multiplexer config
├── zshrc/             # Shell configuration
├── nix-darwin/        # Nix Darwin system flake
├── apply-dotfiles.sh  # Stow-based dotfile application
└── setup             # Legacy setup script
```

### Neovim Configuration
- Entry point: `nvim/init.lua`
- Plugin management: Lazy.nvim (`nvim/lua/josean/lazy.lua`)
- Modular plugin structure in `nvim/lua/josean/plugins/`
- Key plugins: LSP (Mason), Telescope, Treesitter, Harpoon

### tmux Configuration
- Configuration: `tmux/tmux.conf`
- Plugin manager: TPM (Tmux Plugin Manager)
- Key plugins: tmux-resurrect, tmux-continuum, catppuccin theme
- Session management with sessionx and floax

## Branch Strategy
- **main**: Primary branch for macOS dotfiles
- **redhat-variant**: Work computer variant with company-specific modifications
- Target branch for PRs: `main`

## Future Plans
Based on `requirements.md`, there are plans to:
- Create Fedora-specific configurations in a `fedora/` directory
- Migrate tmux/nvim configs for Fedora compatibility
- Remove certain plugins (render-markdown, noice, tmux session restore)

## Key Aliases (from .zshrc)
```bash
v=nvim              # Quick nvim access
dot                 # Navigate to dotfiles
update              # Apply dotfiles
rebuild             # Rebuild nix-darwin
dpb                 # DevPod with dotfiles
gc "message"        # Git add all + commit
gcmp                # Git checkout main + pull
grm                 # Delete merged branches
```

## System Defaults
The nix-darwin flake configures:
- Dock on left side, autohide enabled
- Finder shows all files and extensions
- Touch ID for sudo authentication
- Caps Lock remapped to Escape
- Keyboard key mapping enabled