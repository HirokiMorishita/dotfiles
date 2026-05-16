alias a='fuzzy_alias_look_command'
alias h='fuzzy_history_look_command'
alias e='explorer.exe .'
alias r='exec bash'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias pbcopy='nkf -sc | clip.exe'

alias g='git'
alias gb='git branch'
alias gs='git status'
alias gp='git push'
alias gpo='git push origin'
alias gf='git fetch'
alias gm='git commit'
alias gmm='git commit -m'
alias gma='git commit --amend'
# ga, gd, or etc from forgit

alias spr='fuzzy_start_github_pr_review'
alias fpr='finish_github_pr_review'

alias ncat='bat'
alias ngrep='rg'
alias nfind='fd'

alias fcd='fuzzy_cd'
alias fgcd='fuzzy_ghq_cd_command'

alias open='open'

fuzzy_alias_look_command() {
  local selected_alias
  selected_alias=$(alias | fzf | sed -n "s/^.*='\([^']*\)'/\1/p")
  if [ -n "$selected_alias" ]; then
    $selected_alias
  fi
}

fuzzy_history_look_command() {
  local selected_history
  selected_history=$(history | tac | fzf +m --prompt="History>" | xargs bash -c 'echo ${@:1}')
  if [ -n "$selected_history" ]; then
    $selected_history
  fi
}

fuzzy_ghq_cd_command() {
  local selected_dir
  selected_dir=$(ghq list | fzf)
  if [ -n "$selected_dir" ]; then
    cd $(ghq root)/$selected_dir
  fi
}

fuzzy_cd() {
  local dir
  dir=$(fd ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
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

start_github_pr_review () {
    REPOSITORY=${1}
    BASE_BRANCH=${2}
    PULL_REQUEST_ID=${3}

    REPO_NAME=$(basename $(git remote get-url origin) .git)
    REVIEW_DIR="../${REPO_NAME}-pr-review-${PULL_REQUEST_ID}"

    echo "Starting review."

    git fetch $REPOSITORY $BASE_BRANCH:review/base

    git worktree remove "$REVIEW_DIR" --force 2>/dev/null
    git worktree add "$REVIEW_DIR" review/base

    cd "$REVIEW_DIR"

    git fetch $REPOSITORY pull/${PULL_REQUEST_ID}/head:review/remote

    git merge --squash review/remote
    git submodule update --init
    git reset
}

finish_github_pr_review () {
  CURRENT_DIR=$(basename $PWD)
  REPO_NAME=$(basename $(git remote get-url origin) .git)
  cd ../${REPO_NAME}
  git worktree remove $CURRENT_DIR
}