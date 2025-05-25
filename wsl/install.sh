#!/bin/bash

cd $HOME
TMPDIR=$(mktemp -d -t ./X)
mkdir -p $HOME/.local/bin

sudo apt install \
  gh \
  zsh \
  stow \

chsh -s /bin/zsh

if ! command -v nvim &>/dev/null; then
  #Install Neovim
  sudo apt install cmake ninja-build gettext curl unzip build-essential
  git clone https://github.com/neovim/neovim
  cd neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
fi


#Link dotfiles
cd $HOME/.dotfiles/wsl/
stow --adopt -t $HOME .
git restore .
cd -

cd $HOME
rm -rf $TMPDIR
