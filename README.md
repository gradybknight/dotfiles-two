# dotfiles-two

Personal macOS dotfiles: **zsh**, **tmux**, **Neovim**, **Ghostty**.

## What's in here

| Path | Linked to | Notes |
| --- | --- | --- |
| `zshrc/.zshrc` | `~/.zshrc` | **vi-mode** line editing, native `vcs_info` prompt (git branch + state), history/completion/nav opts, `cdpath`, opt-in fzf/zoxide/eza |
| `tmux/` | `~/.config/tmux` | TPM + Catppuccin Mocha status bar (rounded pills), git state via `gitmux` |
| `tmux/gitmux.conf` | `~/.gitmux.conf` | Catppuccin theme for the `gitmux` status module |
| `nvim/` | `~/.config/nvim` | lazy.nvim; plugins install on first launch |
| `ghostty/config` | `~/.config/ghostty` | Catppuccin Mocha, FiraCode Nerd Font, slight transparency, quick terminal |

Keybindings for all four are catalogued in
[`keystroke-reminders.md`](keystroke-reminders.md).

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
every config, and clones the tmux plugins. Safe to re-run; it skips what's
already done.

```bash
~/git/dotfiles-two/install.sh
```

### 3. Reload the shell

```bash
source ~/.zshrc   # or just open a new terminal
```

Open nvim once — lazy.nvim installs its plugins on first launch. If the tmux
status bar ever looks bare, run `Ctrl-A` then `I` (capital i) to reinstall
plugins via TPM.

## Ghostty config note

On macOS, Ghostty also loads `~/Library/Application Support/com.mitchellh.ghostty/config`
*after* the XDG file, which lets it silently override the tracked config. If Ghostty
ever ignores a setting from `~/.config/ghostty/config`, check whether that file
exists and is shadowing it.

## tmux plugins

`tmux/plugins/` is gitignored — plugins are managed by [TPM](https://github.com/tmux-plugins/tpm),
not vendored. The list lives in the `@plugin` lines of `tmux/tmux.conf`.
`install.sh` clones each one straight into `~/.config/tmux/plugins/` (no tmux
server needed). Inside tmux, `Ctrl-A` + `I` installs any new ones and
`Ctrl-A` + `U` updates them.
