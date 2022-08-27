#!/bin/bash

set -eux

cd $(dirname $0)
PROGNAME=$(basename $0)
DOTFILES=$PWD
XDG_CONFIG_BASE=$DOTFILES/.config
XDG_CONFIG_HOME=$HOME/.config

usage_exit() {
  echo "Usage: $PROGNAME [-h|-c|-g|-r]" 1>&2
  echo
  echo "Options:"
  echo "  -h  show this text"
  echo "  -c  for cli environment"
  echo
  exit 1
}

if [ "$(id -u)" = "0" ]; then
  echo "must run under non-root user"
  exit 1
fi

MODE=""

while getopts cgrhx OPT
do
  case $OPT in
    h) usage_exit
      ;;
    \?) usage_exit
      ;;
    c) MODE="CLI"
      ;;
    x) MODE="CODE"
      ;;
  esac
done

echo $MODE

cli_install() {
  _cli_dep_install
  _cli_settings
  exec $SHELL -l
}

_cli_dep_install() {

  mkdir -p $HOME/bin

  echo "install required packages and update system-wide"
  source $PWD/packages.sh
  clidep=(
    "${alts_arch[@]}"
    "${utils_arch[@]}"
  )
  sudo apt update
  sudo apt upgrade
  sudo apt install $(IFS=' '; echo "${clidep[*]}")

  if !(type brew > /dev/null 2>&1); then
    echo "install brew"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    ln -sf $DOTFILES/.bash_aliases $HOME
  fi

  echo "install starship"
  curl -sS https://starship.rs/install.sh | sh

  echo "install ghq"
  brew install ghq

  echo "install alts procs sd ripgrep vivid"
  brew install procs sd exa ripgrep vivid

  echo "install diff-highlight"
  sudo ln -sf /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
  sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight

  echo "install prettyping"
  rm -rf $HOME/bin/prettyping
  wget https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping -O $HOME/bin/prettyping
  chmod +x $HOME/bin/prettyping

  cd $DOTFILES
}

_cli_settings() {
  mkdir -p $HOME/.config
  ln -sf $DOTFILES/.editorconfig $HOME

  ln -sf $DOTFILES/.gitconfig $HOME
  ln -sf $DOTFILES/.gitconfig.identity.default $HOME
  ln -sf $DOTFILES/.gitignore $HOME
  ln -sf $DOTFILES/.gitmessage $HOME

  ln -sf $XDG_CONFIG_BASE/starship.toml $XDG_CONFIG_HOME/starship.toml

}

code_settings() {
  cmds="code vscode"
  for cmd in ${cmds[@]}; do
    if type $cmd > /dev/null 2>&1; then
      _code_ext "$cmd"
    fi
  done
  _code_cfg
}

_code_ext() {
  echo "install extensions to $cmd"
  \cat $XDG_CONFIG_BASE/Code/extensions | while read line; do
    echo "add ${line} to ${cmd}"
    $cmd --install-extension $line --force
  done
  echo "uninstall extensions to $cmd"
  \cat $XDG_CONFIG_BASE/Code/x_extensions | while read line; do
    echo "remove ${line} from ${cmd}"
    $cmd --uninstall-extension $line --force
  done
}

_code_cfg() {
  echo "place configs"
  mkdir -p $XDG_CONFIG_HOME/Code/User
  ln -sf $XDG_CONFIG_BASE/Code/User/settings.json $XDG_CONFIG_HOME/Code/User
  ln -sf $XDG_CONFIG_BASE/Code/User/keybindings.json $XDG_CONFIG_HOME/Code/User
}

if [ "$MODE" = "CLI" ]; then
  cli_install
elif [ "$MODE" = "CODE" ]; then
  code_settings
else
  usage_exit
fi
