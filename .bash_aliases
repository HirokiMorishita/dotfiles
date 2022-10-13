
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
alias g='cd $(ghq root)/$(ghq list | fzf --reverse)'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND='fd --type f'
export FZF_ALT_C_COMMAND='fd --type d'