# dotfiles-two

Personal macOS dotfiles: **zsh**, **tmux**, **Neovim**, **Ghostty**.

## What's in here

| Path | Linked to | Notes |
| --- | --- | --- |
| `zshrc/.zshrc` | `~/.zshrc` | native `vcs_info` prompt (git branch + state), history/completion/nav opts, `cdpath`, opt-in fzf/zoxide/eza |
| `tmux/` | `~/.config/tmux` | TPM + Catppuccin Mocha, git branch in the status bar via `gitmux` |
| `tmux/gitmux.conf` | `~/.gitmux.conf` | Catppuccin theme for the `gitmux` status module |
| `nvim/` | `~/.config/nvim` | lazy.nvim; plugins install on first launch |
| `ghostty/config` | `~/.config/ghostty` | Catppuccin Mocha, FiraCode Nerd Font, quick terminal |

## Packages

Everything is managed with **Homebrew**. The full list lives in [`Brewfile`](Brewfile):

| Package | Why |
| --- | --- |
| `zsh`, `neovim`, `tmux` | shell, editor, multiplexer |
| `nvm` | Node version manager (loaded in `.zshrc`) |
| `fzf` | zsh `Ctrl-R`/`Ctrl-T`/`Alt-C`; tmux-fzf, fzf-url, sessionx |
| `zoxide` | `z` jumping; sessionx zoxide mode |
| `eza` | `ls` / `la` / `lt` aliases |
| `gitmux` | git branch + state in the tmux status bar |
| `ripgrep` | nvim search, `rg` |
| `tree` | `ttwo` alias |
| `stow` | legacy `apply-dotfiles.sh` linker |
| `ghostty` (cask) | terminal |
| `font-fira-code-nerd-font`, `font-symbols-only-nerd-font` (casks) | prompt / tmux / eza glyphs |

`git` comes from the Xcode Command Line Tools, so it is not in the Brewfile.

Install or re-sync everything at any time:

```bash
brew bundle --file ~/git/dotfiles-two/Brewfile
```

## Setup

### 1. Clone

```bash
git clone https://github.com/gradybknight/dotfiles-two.git ~/git/dotfiles-two
```

### 2. Run the installer

Installs Homebrew if missing, runs `brew bundle` against the `Brewfile`, symlinks
every config, and clones TPM. Safe to re-run; it skips what's already done.

```bash
~/git/dotfiles-two/install.sh
```

### 3. Finish tmux plugins — **not automated**

```bash
tmux              # start a server
# then press:  Ctrl-A  then  I     (capital i — installs plugins via TPM)
```

### 4. Reload the shell

```bash
source ~/.zshrc   # or just open a new terminal
```

## Ghostty config note

On macOS, Ghostty also loads `~/Library/Application Support/com.mitchellh.ghostty/config`
*after* the XDG file, which lets it silently override the tracked config. That file
is kept empty on purpose so `~/.config/ghostty/config` wins. If Ghostty ever ignores
a setting, check there first.

> `apply-dotfiles.sh` is the older `stow`-based linker and is superseded by `install.sh`.
