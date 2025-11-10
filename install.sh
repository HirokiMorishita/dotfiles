#!/bin/bash

set -eux

cd $(dirname $0)
git submodule update --init
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

  echo "install python dependencies"
  sudo apt install -y build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

  if !(type ghq > /dev/null 2>&1); then
    echo "install ghq"
    asdf plugin add ghq
    asdf install ghq latest
    asdf global ghq latest
  fi

  if !(type cargo > /dev/null 2>&1); then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  fi

  cd $DOTFILES
}

settings() {
  ln -sf $DOTFILES/.editorconfig $HOME

  ln -sf $DOTFILES/.bash_aliases $HOME
  ln -sf $DOTFILES/.bash_profile $HOME
  ln -sf $DOTFILES/.gitconfig.installed $HOME
  ln -sf $DOTFILES/.gitignore $HOME
  ln -sf $DOTFILES/.gitmessage $HOME

  ln -sf $DOTFILES/.bashrc $HOME
  ln -sf $DOTFILES/.gitconfig $HOME
}

settings_devcontainer() {

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

install_min() {
  echo "install required packages and update system-wide"
  source $PWD/packages.sh
  clidep=(
    "${alts_arch[@]}"
    "${utils_arch[@]}"
  )

  # yarnのリポジトリの鍵更新
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --yes --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null

  sudo apt update
  sudo apt install $(IFS=' '; echo "${clidep[*]}") -y


  sudo sed -i -E 's/# (ja_JP.UTF-8)/\1/' /etc/locale.gen
  sudo locale-gen
  sudo update-locale LANG=ja_JP.UTF-8

  # aptだと古いものが入るのでリポジトリから直接もってくる
  echo "install fzf"
  if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  fi
  pushd ~/.fzf && git pull && popd
  ~/.fzf/install --key-bindings --completion --update-rc

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

  curl -L https://github.com/dandavison/delta/releases/download/0.16.5/git-delta-musl_0.16.5_amd64.deb -o /tmp/git-delta.deb \
  && sudo dpkg -i /tmp/git-delta.deb

  curl -L https://github.com/BurntSushi/ripgrep/releases/download/14.0.3/ripgrep_14.0.3-1_amd64.deb -o /tmp/ripgrep.deb \
  && sudo dpkg -i /tmp/ripgrep.deb

  curl -L https://github.com/sharkdp/vivid/releases/download/v0.9.0/vivid-musl_0.9.0_amd64.deb -o /tmp/vivid.deb \
  && sudo dpkg -i /tmp/vivid.deb

  curl -L https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-musl_0.24.0_amd64.deb -o /tmp/bat.deb \
  && sudo dpkg -i /tmp/bat.deb

  curl -L https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-musl_9.0.0_amd64.deb -o /tmp/fd.deb \
  && sudo dpkg -i /tmp/fd.deb
}

if [ -n "${REMOTE_CONTAINERS:-}" ] ; then
  install_min
  settings_devcontainer
else
  install
  settings
fi