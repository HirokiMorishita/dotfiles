#!/bin/bash

set -eux

cd $(dirname $0)
PROGNAME=$(basename $0)
DOTFILES=$PWD
XDG_CONFIG_BASE=$DOTFILES/.config
XDG_CONFIG_HOME=$HOME/.config


if [ "$(id -u)" = "0" ]; then
  echo "must run under non-root user"
  exit 1
fi

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
  sudo apt install $(IFS=' '; echo "${clidep[*]}") -y

  if !(type brew > /dev/null 2>&1); then
    echo "install brew"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
  ln -sf $DOTFILES/.bash_aliases $HOME

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

  echo "install gh"
  type -p curl >/dev/null || sudo apt install curl -y
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

  cd $DOTFILES
}

_cli_settings() {
  mkdir -p $XDG_CONFIG_HOME
  ln -sf $DOTFILES/.editorconfig $HOME

  ln -sf $DOTFILES/.gitconfig $HOME
  ln -sf $DOTFILES/.gitconfig.identity.personal $HOME/.gitconfig.identity
  ln -sf $DOTFILES/.gitconfig.pager $HOME
  ln -sf $DOTFILES/.gitignore $HOME
  ln -sf $DOTFILES/.gitmessage $HOME

  ln -sf $XDG_CONFIG_BASE/starship.toml $XDG_CONFIG_HOME/starship.toml

}

cli_install
