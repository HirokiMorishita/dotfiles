#!/bin/bash

set -eux

cd $(dirname $0)
DOTFILES=$PWD
XDG_CONFIG_BASE=$DOTFILES/.config
XDG_CONFIG_HOME=$HOME/.config
mkdir -p $HOME/bin
mkdir -p $XDG_CONFIG_HOME


install() {
  install_min

  echo "install asdf"
  if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
  fi
  . $HOME/.asdf/asdf.sh

  if !(type ghq > /dev/null 2>&1); then
    echo "install ghq"
    asdf plugin add ghq
    asdf install ghq latest
    asdf global ghq latest
  fi

  if !(type cargo > /dev/null 2>&1); then
    asdf plugin-add rust https://github.com/asdf-community/asdf-rust.git
    asdf install rust latest
    asdf global rust latest
  fi

  echo "install alts"
  cargo install ripgrep exa procs sd

  echo "install vivid"
  cargo install vivid

  echo "install prettyping"
  rm -rf $HOME/bin/prettyping
  wget https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping -O $HOME/bin/prettyping
  chmod +x $HOME/bin/prettyping

  cd $DOTFILES
}

settings() {
  ln -sf $DOTFILES/.editorconfig $HOME

  ln -sf $DOTFILES/.bashrc $HOME
  ln -sf $DOTFILES/.bash_aliases $HOME
  ln -sf $DOTFILES/.gitconfig $HOME
  ln -sf $DOTFILES/.gitconfig.identity.personal $HOME/.gitconfig.identity
  ln -sf $DOTFILES/.gitignore $HOME
  ln -sf $DOTFILES/.gitmessage $HOME
}

settings_devcontainer() {

  ln -sf $DOTFILES/.bash_aliases $HOME
  ln -sf $DOTFILES/.bashrc $HOME/.bashrc.dotfiles
  ln -sf $DOTFILES/.gitconfig $HOME/.gitconfig.dotfiles
  ln -sf $DOTFILES/.gitconfig.identity.personal $HOME/.gitconfig.identity
  ln -sf $DOTFILES/.gitignore $HOME
  ln -sf $DOTFILES/.gitmessage $HOME
  echo "\n source ~/.bashrc.dotfiles" >> $HOME/.bashrc
  git config --global include.path ~/.gitconfig.dotfiles
}

install_min() {
  echo "install required packages and update system-wide"
  source $PWD/packages.sh
  clidep=(
    "${alts_arch[@]}"
    "${utils_arch[@]}"
  )
  sudo apt update
  sudo apt upgrade -y
  sudo apt install $(IFS=' '; echo "${clidep[*]}") -y

  sudo update-locale LANG=ja_JP.UTF-8


  echo "install starship"
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
  ln -sf $XDG_CONFIG_BASE/starship.toml $XDG_CONFIG_HOME/starship.toml

  echo "install gh"
  type -p curl >/dev/null || sudo apt install curl -y
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y


  if [ -f /usr/share/doc/git/contrib/diff-highlight/diff-highlight ] ; then
    echo "install diff-highlight"
    ln -sf /usr/share/doc/git/contrib/diff-highlight/diff-highlight $HOME/bin/diff-highlight
    sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
    ln -sf $DOTFILES/.gitconfig.pager $HOME
  fi

}

if [ -n "${REMOTE_CONTAINERS:-}" ] ; then
  install_min
  settings_devcontainer
else
  install
  settings
fi
