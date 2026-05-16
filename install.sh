#!/bin/bash

set -eux

cd $(dirname $0)
DOTFILES=$PWD
XDG_CONFIG_BASE=$DOTFILES/.config
XDG_CONFIG_HOME=$HOME/.config
mkdir -p $HOME/bin
mkdir -p $XDG_CONFIG_HOME

settings() {
  ln -sf $DOTFILES/.editorconfig $HOME
  mkdir -p $HOME/.config/mise/
  ln -sf $DOTFILES/mise.toml $HOME/.config/mise/config.toml
  ln -sf $XDG_CONFIG_BASE/starship.toml $XDG_CONFIG_HOME/starship.toml

  ln -sf $DOTFILES/.bash_aliases $HOME
  ln -sf $DOTFILES/.bash_profile $HOME
  ln -sf $DOTFILES/.gitconfig.installed $HOME
  ln -sf $DOTFILES/.gitignore $HOME
  ln -sf $DOTFILES/.gitmessage $HOME

  ln -sf $DOTFILES/.bashrc $HOME
  ln -sf $DOTFILES/.gitconfig $HOME
}

settings_devcontainer() {
  git submodule update --init

  mkdir -p $HOME/.config/mise/
  ln -sf $DOTFILES/mise.toml $HOME/.config/mise/config.toml
  ln -sf $XDG_CONFIG_BASE/starship.toml $XDG_CONFIG_HOME/starship.toml

  ln -sf $DOTFILES/.bash_aliases $HOME
  ln -sf $DOTFILES/.bash_profile $HOME
  ln -sf $DOTFILES/.gitconfig.installed $HOME
  ln -sf $DOTFILES/.gitignore $HOME
  ln -sf $DOTFILES/.gitmessage $HOME

  ln -sf $DOTFILES/.bashrc $HOME/.bashrc.dotfiles
  echo "source ~/.bashrc.dotfiles" >> $HOME/.bashrc

  ln -sf $DOTFILES/.gitconfig $HOME/.gitconfig.dotfiles
  git config --global --add include.path ~/.gitconfig.dotfiles
}

install() {

  sudo apt-get update
  sudo apt-get install -y locales nkf bash-completion ssh

  sudo sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen
  sudo locale-gen
  sudo update-locale LANG=ja_JP.UTF-8

  if !(type -t mise > /dev/null 2>&1); then
    echo "install mise"
    curl https://mise.run | sh
    eval "$(~/.local/bin/mise activate bash)"
  fi
  mise install -y gh
  mise use gh
  if [ "$(gh auth status -a --json hosts --jq '.hosts."github.com"[0].active')" != "true" ]; then
    gh auth login
  fi
  mise install -y
}

if [ -n "${REMOTE_CONTAINERS:-}" ] ; then
  install
  settings_devcontainer
else
  install
  settings
fi