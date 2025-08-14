# Fedora Dotfiles Setup

This directory contains Fedora-specific configurations derived from the main dotfiles repository, optimized for Fedora Linux systems.

## Overview

The Fedora setup includes:
- **tmux**: Terminal multiplexer configuration (without session restore)
- **nvim**: Neovim configuration (without render-markdown and noice plugins)
- **Automatic setup script**: Handles package installation and symlink creation

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/gradybknight/dotfiles-two.git ~/git/dotfiles
cd ~/git/dotfiles
```

### 2. Run the Setup Script

The setup script will handle everything automatically:

```bash
chmod +x fedora/setup-fedora.sh
./fedora/setup-fedora.sh
```

### 3. Post-Setup Steps

After running the setup script:

1. **Restart your terminal** or log out/in to apply zsh as default shell
2. **Install tmux plugins**: Start tmux and press `Ctrl-A + I`
3. **Let nvim install plugins**: Open nvim and plugins will install automatically

## What the Setup Script Does

### Package Installation
Installs essential development packages via DNF:
- neovim, tmux, git, stow, ripgrep, fzf, tree, jq
- nodejs, npm, python3-pip
- curl, wget, zsh, util-linux-user

### Configuration Setup
- Creates symlinks for nvim and tmux configurations
- Sets up tmux plugin manager (TPM)
- Installs pure prompt for zsh
- Symlinks .zshrc if available
- Backs up existing configurations before replacing

### Shell Configuration
- Sets zsh as the default shell
- Configures pure prompt for a clean terminal experience

## Manual Setup (Alternative)

If you prefer manual setup or need to customize the process:

### 1. Install Required Packages

```bash
sudo dnf update -y
sudo dnf install -y neovim tmux git stow ripgrep fzf tree jq nodejs npm python3-pip curl wget zsh util-linux-user
```

### 2. Create Symlinks

```bash
# Create config directory
mkdir -p ~/.config

# Symlink configurations
ln -sf ~/git/dotfiles/fedora/nvim ~/.config/nvim
ln -sf ~/git/dotfiles/fedora/tmux ~/.config/tmux

# Symlink zshrc (if desired)
ln -sf ~/git/dotfiles/zshrc/.zshrc ~/.zshrc
```

### 3. Setup Shell and Plugins

```bash
# Set zsh as default shell
chsh -s $(which zsh)

# Install pure prompt
mkdir -p ~/.zsh
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Configuration Details

### tmux Changes for Fedora
- **Removed**: tmux-resurrect and tmux-continuum plugins (no session restore)
- **Kept**: All other plugins including catppuccin theme, sessionx, floax
- **Updated**: Removed macOS-specific comments and paths

### Neovim Changes for Fedora
- **Removed**: render-markdown plugin and its cmp source
- **Removed**: noice plugin (intrusive notifications)
- **Kept**: All other plugins including LSP, telescope, treesitter, harpoon

### Directory Structure
```
fedora/
├── README.md           # This file
├── setup-fedora.sh     # Automated setup script
├── tmux/              # tmux configuration
│   ├── tmux.conf
│   └── tmux.reset.conf
└── nvim/              # Neovim configuration
    ├── init.lua
    └── lua/
        └── josean/
            ├── core/
            ├── lazy.lua
            └── plugins/
```

## Troubleshooting

### Common Issues

**tmux plugins not installing:**
- Make sure you're pressing `Ctrl-A + I` (not `Ctrl-B`)
- Check that TPM is installed at `~/.tmux/plugins/tpm`

**nvim plugins not loading:**
- Check that neovim version is 0.8+ with `nvim --version`
- Let lazy.nvim install plugins on first startup

**zsh not set as default:**
- Run `chsh -s $(which zsh)` and restart terminal
- Check current shell with `echo $SHELL`

**Permission issues:**
- Make sure you have sudo access for package installation
- Check file permissions on symlinked configurations

### Getting Help

If you encounter issues:
1. Check the main repository for updates
2. Review the setup script output for error messages
3. Ensure all dependencies are properly installed

## Updates and Maintenance

To update configurations:

```bash
cd ~/git/dotfiles
git pull origin main
```

Since configurations are symlinked, updates to the repository will automatically apply to your system.

## Differences from macOS Version

This Fedora setup differs from the main macOS dotfiles in several ways:
- Uses DNF package manager instead of Nix/Homebrew
- Removes session restore functionality from tmux
- Excludes render-markdown and noice plugins from nvim
- Uses pure prompt instead of Nix-managed prompts
- Symlink-based approach instead of stow for some components