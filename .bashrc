export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:"$(wslpath "$(wslvar USERPROFILE)")/AppData/Local/Programs/Microsoft VS Code/bin"

export LESS='-R'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND='fd --type f'
export FZF_ALT_C_COMMAND='fd --type d'
export LANG=ja_JP.utf-8

if (type vivid > /dev/null 2>&1); then
  export LS_COLORS="$(vivid generate snazzy)"
fi

eval "$(starship init bash)"

DOTFILES="$HOME/.dotfiles"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ] ; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
  source /usr/share/doc/fzf/examples/completion.bash
fi

if [ -d $HOME/.asdf ] ; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

if [ -n "${REMOTE_CONTAINERS:-}" ] ; then
  source ~/.bashrc.dotfiles
else
  eval "$(ssh-agent -s)" > /dev/null
fi