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
alias gl='git plog'

alias spr='fuzzy_start_github_pr_review'
alias fpr='fuzzy_finish_github_pr_review'

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
alias ul='less_with_unbuffer'

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
  ln -sf ~/.config/hub.personal ~/.config/hub
}
use_office_config(){
  ln -sf $DOTFILES/.gitconfig.identity.office $HOME/.gitconfig.identity
  ln -sf ~/.config/hub.office ~/.config/hub
}

less_with_unbuffer () {
  unbuffer "$@" |& less -SR
}

fuzzy_start_github_pr_review() {
  local default_repository
  local selected_pr_number
  default_repository=${1:-"origin"}
  selected_pr_number=$(gh pr list | fzf | awk '{print $1}')
  if [ -n "$selected_pr_number" ] ; then
    local params
    params=$(gh pr list -q ".[] | if .number == $selected_pr_number then .baseRefName,.number else empty end" --json number,baseRefName)
    start_github_pr_review $default_repository ${params[0]} ${params[1]}
  fi
}

fuzzy_finish_github_pr_review() {
  local default_branch
  default_branch=${1:-"$(git remote show origin | grep 'HEAD branch' | awk '{print $NF}')"}
  finish_github_pr_review ${default_branch}
}

# Tさんのスクリプト
start_github_pr_review () {
    REPOSITORY=${1}
    BASE_BRANCH=${2}
    PULL_REQUEST_ID=${3}

    nothing_to_commit=`git status | grep "nothing to commit"`
    if [ -z "$nothing_to_commit" ] ; then
        echo "You have something to commit."
        return
    fi

    echo "Starting review."

    git checkout $BASE_BRANCH
    git branch -D review/base review/remote review/working

    git fetch $REPOSITORY $BASE_BRANCH:review/base
    git fetch $REPOSITORY pull/${PULL_REQUEST_ID}/head:review/remote

    git checkout review/base
    git checkout -b review/working

    git merge --squash review/remote
}

finish_github_pr_review () {
    BASE_BRANCH=${1}

    git reset --hard HEAD

    git checkout $BASE_BRANCH
    git branch -D review/base review/remote review/working
}