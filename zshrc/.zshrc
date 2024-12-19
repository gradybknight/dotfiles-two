# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

PURE_GIT_PULL=0


if [[ "$OSTYPE" == darwin* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  fpath+=($HOME/.zsh/pure)
fi

autoload -U promptinit; promptinit
prompt pure

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias v=nvim
alias c="clear"
alias ls='ls --color=auto -a1'
alias la='ls -lathr'
alias e='exit'
alias dot='cd ~/git/dotfiles/'
alias update='~/git/dotfiles/apply-dotfiles.sh'
alias rebuild='darwin-rebuild switch --flake ~/git/dotfiles/nix-darwin'

# finds all files recursively and sorts by last modification, ignore hidden files
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

# Git
alias gp='git pull'
alias gs='git status'
alias gcmp='git checkout main && git pull'
# Delete merged local git branches
alias grm='git branch --merged | grep -v "\*" | grep -v main | xargs -n 1 git branch -d'
