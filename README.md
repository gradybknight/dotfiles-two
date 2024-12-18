## Applying Your Dotfiles

Follow these steps to set up your system and apply your dotfiles.

### 1. Clone Your Dotfiles Repo

```bash
git clone https://github.com/gradybknight/dotfiles-two.git ~/git/dotfiles
```

### 2. Install `nix`

Follow the official instructions for installing Nix on macOS:
https://nixos.org/download.html

### 3. Run `nix-darwin` to Apply the Flake

```bash
nix run nix-darwin -- switch --flake ~/git/dotfiles/nix-darwin
```

### 4. Apply Your Dotfiles

Run the provided script to symlink your dotfiles to `~/.config` using `stow`.

```bash
chmod +x ~/git/dotfiles/apply-dotfiles.sh
~/git/dotfiles/apply-dotfiles.sh
```

### 5. Update Dotfiles in the Future

If you make changes to your dotfiles repository, you can pull the latest changes and re-apply the symlinks:

## setup tmux - **This is not automated**

- Clone TPM into your ~/.tmux/plugins directory:
  `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- `tmux`
- `ctrl-A then I`
