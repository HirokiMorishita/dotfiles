
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $($(brew --prefix)/bin/brew shellenv)
umask 002

if [[ $(command -v vivid) ]]; then
  export LS_COLORS="$(vivid generate snazzy)"
fi

eval "$(starship init bash)"


alias fd=fdfind
alias bat=batcat
alias h='history | fzf --reverse'
alias e='explorer.exe .'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gf='git fetch'
alias gco='git checkout'
alias gc='git commit'
alias gca='git commit --ammend'
alias gcp='git cherry-pick'
alias gcd='cd $(ghq root)/$(ghq list | fzf --reverse)'

alias nls='exa'
alias nps='procs'
alias ncat='bat'
alias ndf='dfc'
alias ntop='htop'
alias ndu='ncdu'
alias ngrep='rg'
alias nsed='sd'
alias nfind='fdfind'
alias fgco='fgco'
alias fgcor='fgcor'
alias fcd='fcd'
alias open='open'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND='fd --type f'
export FZF_ALT_C_COMMAND='fd --type d'

# fgco - checkout git branch
fgco() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fgcor - checkout git branch (including remote branches)
fgcor() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fcd - cd to selected directory
fcd() {
  local dir
  dir=$(fd ${1:-.} --type d -H -E .git 2> /dev/null | fzf +m) &&
  cd "$dir"
}

open() {
  if [ $# -ne 1 ]; then return 1; fi
  if [ -e "$1" ]; then
    local winpath=$(wslpath -w "$(readlink -f "$1")")
    powershell.exe start "\"${winpath}\""
  else
    powershell.exe start "$1"
  fi
}