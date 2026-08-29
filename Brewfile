# Brewfile — every Homebrew package the dotfiles-two configs depend on.
# Sync with:  brew bundle --file ~/git/dotfiles-two/Brewfile
# (install.sh does this for you.)
# Note: `git` is provided by the Xcode Command Line Tools, so it's not listed here.

# ---- Shell / editor / multiplexer ----
brew "zsh"
brew "neovim"
brew "tmux"
brew "nvm"                # Node version manager, loaded in .zshrc

# ---- CLI tools the zsh + tmux configs invoke ----
brew "fzf"                # zsh Ctrl-R/Ctrl-T/Alt-C; tmux-fzf, tmux-fzf-url, sessionx
brew "zoxide"             # `z` in zsh; sessionx zoxide mode
brew "eza"                # ls / la / lt aliases
brew "gitmux"             # git branch + state in the tmux status bar
brew "ripgrep"            # nvim search; `rg`
brew "tree"               # `ttwo` alias

# ---- Apps ----
cask "ghostty"            # terminal

# ---- Fonts (prompt / tmux / eza glyphs) ----
cask "font-fira-code-nerd-font"
cask "font-symbols-only-nerd-font"
