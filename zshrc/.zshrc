# ~~~~~~~~~~~~~~~ Path ~~~~~~~~~~~~~~~~~~~~~~~~~~
export PATH="$HOME/.local/bin:$PATH"

# ~~~~~~~~~~~~~~~ NVM ~~~~~~~~~~~~~~~~~~~~~~~~~~~
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ~~~~~~~~~~~~~~~ Environment ~~~~~~~~~~~~~~~~~~~~
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS='-R'
# Nice `ls` / completion colours
export CLICOLOR=1
export LSCOLORS='ExGxBxDxCxEgEdxbxgxcxd'

# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY          # write timestamps
setopt INC_APPEND_HISTORY        # append as you go, not just on exit
setopt SHARE_HISTORY             # share history live between shells
setopt HIST_IGNORE_ALL_DUPS      # drop older duplicate commands
setopt HIST_IGNORE_SPACE         # " command" is not recorded
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY               # expand !! etc. into the line before running

# ~~~~~~~~~~~~~~~ Shell behaviour ~~~~~~~~~~~~~~~~
setopt AUTO_CD                   # `foo/bar` == `cd foo/bar`
setopt AUTO_PUSHD                # `cd` keeps a directory stack...
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt INTERACTIVE_COMMENTS      # allow `# comments` at the prompt
setopt NO_BEEP
setopt GLOB_DOTS                 # globs match dotfiles too

# `d` shows the dir stack, `1`/`2`/... jump to an entry
alias d='dirs -v'
for i in {1..9}; do alias "$i"="cd +$i"; done

# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~
autoload -Uz compinit
compinit -C
zstyle ':completion:*' menu select                      # arrow-key menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' special-dirs true

# ~~~~~~~~~~~~~~~ Keybindings ~~~~~~~~~~~~~~~~~~~~
bindkey -e                                               # emacs-style line editing
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search               # Up   -> prefix history search
bindkey '^[[B' down-line-or-beginning-search             # Down -> prefix history search
bindkey '^[[1;5C' forward-word                           # Ctrl-Right
bindkey '^[[1;5D' backward-word                          # Ctrl-Left

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~
# Two-line prompt:
#   <path>   <branch> <git state>            <elapsed>
#   ❯
# Colours are Catppuccin Mocha to match tmux/ghostty.
zmodload zsh/datetime
autoload -Uz vcs_info add-zsh-hook
setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr   ' %F{#a6e3a1}+%f'
zstyle ':vcs_info:git:*' unstagedstr ' %F{#f9e2af}!%f'
zstyle ':vcs_info:git:*' formats       ' %F{#cba6f7}%b%f%c%u%m'
zstyle ':vcs_info:git:*' actionformats ' %F{#cba6f7}%b%f %F{#f38ba8}(%a)%f%c%u%m'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-aheadbehind

+vi-git-untracked() {
  emulate -L zsh
  [[ -n $(git ls-files --others --exclude-standard 2>/dev/null | head -1) ]] &&
    hook_com[unstaged]+=' %F{#f38ba8}?%f'
}
+vi-git-aheadbehind() {
  emulate -L zsh
  local ahead behind
  ahead=$(git rev-list --count '@{upstream}..HEAD' 2>/dev/null)
  behind=$(git rev-list --count 'HEAD..@{upstream}' 2>/dev/null)
  (( ${ahead:-0}  )) && hook_com[misc]+=" %F{#a6e3a1}⇡${ahead}%f"
  (( ${behind:-0} )) && hook_com[misc]+=" %F{#f38ba8}⇣${behind}%f"
}

# Track how long the last command took, show it on the right when slow (>=3s).
_prompt_timer_preexec() { _prompt_timer_start=$EPOCHREALTIME }
_prompt_timer_precmd() {
  _prompt_elapsed=''
  if (( _prompt_timer_start )); then
    local -F d=$(( EPOCHREALTIME - _prompt_timer_start ))
    local -i s=$(( int(d) ))
    if (( s >= 60 )); then
      _prompt_elapsed="$(( s / 60 ))m$(( s % 60 ))s"
    elif (( d >= 3 )); then
      _prompt_elapsed="$(printf '%.1fs' $d)"
    fi
    _prompt_timer_start=0
  fi
}
add-zsh-hook preexec _prompt_timer_preexec
add-zsh-hook precmd  _prompt_timer_precmd
add-zsh-hook precmd  vcs_info

# ssh sessions get a host tag so you know you're not local
_prompt_host=''
[[ -n $SSH_CONNECTION ]] && _prompt_host='%F{#f9e2af}%n@%m%f '

PROMPT='${_prompt_host}%F{#89b4fa}%(4~|…/%3~|%~)%f${vcs_info_msg_0_}
%(?.%F{#a6e3a1}.%F{#f38ba8})❯%f '
RPROMPT='%F{#6c7086}${_prompt_elapsed}%f'

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias v='nvim'
alias c="clear"
alias ls='ls --color=auto -a1'
alias la='ls -lathr'
alias x='exit'
alias ..='cd ..'
alias ...='cd ../..'
alias dot='cd ~/git/dotfiles-two/'

# finds all files recursively and sorts by last modification, ignore hidden files
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lrt {} +'

# Git
alias gp='git pull'
alias gs='git status'
alias gd='git diff'
alias gl='git log --graph --oneline --decorate --all -20'
alias gco='git checkout'
alias gb='git branch'
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

# ~~~~~~~~~~~~~~~ Optional tools (used only if installed) ~~~~~~~~~~~
# brew install fzf zoxide eza  ->  and these light up automatically.
command -v fzf   >/dev/null && source <(fzf --zsh) 2>/dev/null
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"   # adds `z <dir>`
if command -v eza >/dev/null; then
  alias ls='eza --group-directories-first --icons=auto -a'
  alias la='eza --group-directories-first --icons=auto -la --git'
  alias lt='eza --tree --level=2 --icons=auto'
fi
