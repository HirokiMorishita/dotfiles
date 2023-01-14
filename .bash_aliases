alias fd=fdfind
alias bat=batcat
alias a='fuzzy_alias_look_command'
alias h='history | fzf --reverse'
alias e='explorer.exe .'
alias p='use_personal_config'
alias o='use_office_config'
alias r='exec bash'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gpo='git push origin'
alias gf='git fetch'
alias gco='git checkout'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcp='git cherry-pick'

alias ul='less_with_unbuffer'
alias nls='exa'
alias nps='procs'
alias ncat='bat'
alias ndf='dfc'
alias ntop='htop'
alias ndu='ncdu'
alias ngrep='rg'
alias nsed='sd'
alias nfind='fdfind'
alias nping='prettyping'
alias fcd='fuzzy_cd'
alias fgcd='fuzzy_ghq_cd_command'
alias fgco='fuzzy_git_checkout'
alias fgcor='fuzzy_git_checkout_remote'
alias open='open'

bind -x '"\C-g": fuzzy_ghq_cd_bind'
bind -x '"\C-a": fuzzy_alias_look_bind'

fuzzy_alias_look() {
  alias | fzf
}
fuzzy_alias_look_command() {
  local selected_alias
  selected_alias=$(fuzzy_alias_look | sed -n "s/^.*='\([^']*\)'/\1/p")
  if [ -n "$selected_alias" ]; then
    $selected_alias
  fi
}
fuzzy_alias_look_bind() {
  local selected_alias
  selected_alias=$(fuzzy_alias_look | sed -n 's/.*alias\([^=]*\)=.*/\1/p')
  if [ -n "$selected_alias" ]; then
    READLINE_LINE="$selected_alias"
    READLINE_POINT=${#selected_alias}
  fi
}

fuzzy_ghq_cd() {
  ghq list | fzf
}

fuzzy_ghq_cd_command() {
  local selected_dir
  selected_dir=$(fuzzy_ghq_cd)
  if [ -n "$selected_dir" ]; then
    cd $(ghq root)/$selected_dir
  fi
}

fuzzy_ghq_cd_bind() {
  local selected_dir
  selected_dir=$(ghq list | fzf)
  if [ -n "$selected_dir" ]; then
    local tmp
    tmp="cd $(ghq root)/$selected_dir"
    READLINE_LINE="$tmp"
    READLINE_POINT=${#tmp}
  fi
}

fuzzy_git_checkout() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

fuzzy_git_checkout_remote() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fuzzy_cd() {
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

use_personal_config(){
  ln -sf $DOTFILES/.gitconfig.identity.personal $HOME/.gitconfig.identity
}
use_office_config(){
  ln -sf $DOTFILES/.gitconfig.identity.office $HOME/.gitconfig.identity
}

less_with_unbuffer () {
    unbuffer "$@" |& less -SR
}
