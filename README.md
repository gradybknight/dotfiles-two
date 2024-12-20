## Applying Your Dotfiles

Follow these steps to set up your system and apply your dotfiles.

### 1. Clone Dotfiles Repo

```bash
git clone https://github.com/gradybknight/dotfiles-two.git ~/git/dotfiles
```

### 2. Install `nix`

Follow the official instructions for installing Nix on macOS:
https://nixos.org/download.html

### 3. Run `nix-darwin` to Apply the Flake

- See the `sed` command in the [nix-darwin repo](https://github.com/LnL7/nix-darwin?tab=readme-ov-file#step-1-creating-flakenix). Make sure the computer's name near the bottom of the flake.nix is correct

- Run the build command

```bash
nix run nix-darwin -- switch --flake ~/git/dotfiles/nix-darwin
```

- After applying dotfiles below there is an alias to `rebuild` which will rebuild the flake from the dotfile. **TODO** figure out how to manage multiple computer names

### 4. Apply Your Dotfiles

Run the provided script to symlink your dotfiles to `~/.config` using `stow`.

```bash
chmod +x ~/git/dotfiles/apply-dotfiles.sh
~/git/dotfiles/apply-dotfiles.sh
```

### 5. setup tmux - **This is not automated**

- Clone TPM into your ~/.tmux/plugins directory:
  `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- `tmux`
- `ctrl-A then I`

### 6. Add `aerospace` to startup items

- use the Mac OS UI
