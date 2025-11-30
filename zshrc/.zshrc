# ~~~~~~~~~~~~~~~ Path ~~~~~~~~~~~~~~~~~~~~~~~~~~
export PATH="$HOME/.local/bin:$PATH"

# ~~~~~~~~~~~~~~~ NVM ~~~~~~~~~~~~~~~~~~~~~~~~~~~
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias v='nvim'
alias c="clear"
alias ls='ls --color=auto -a1'
alias la='ls -lathr'
alias x='exit'
alias ..='cd ..'
alias dot='cd ~/git/dotfiles-two/'

# finds all files recursively and sorts by last modification, ignore hidden files
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

# Git
alias gp='git pull'
alias gs='git status'
alias gcmp='git checkout main && git pull'

# Delete merged local git branches
alias grm='git branch --merged | grep -v "\*" | grep -v main | xargs -n 1 git branch -d'

# Create a new branch and check it out
alias gcobd='function _gcobd() { git checkout -b "$1"; }; _gcobd'

# Add all changes and commit with a message
alias gc='function _gc() { git add -A && git commit -m "$1"; }; _gc'

# push using current branch name
alias gpuo='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

# tree two levels
alias ttwo='tree -L 2 -a'

