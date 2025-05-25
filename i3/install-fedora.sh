#!/bin/bash

cd $HOME
TMPDIR=$(mktemp -d -t .)

sudo dnf install \
  zsh \
  feh \
  kitty \
  rofi \
  nitrogen \
  stow \
  polybar \
  picom \
  gh

chsh -s /bin/zsh

#Link dotfiles
cd $HOME/.dotfiles/
stow --adopt .
git restore .
cd -

#Copy fonts
if ! [ -d $HOME/.local/share/fonts ]; then
  mkdir -p $HOME/.local/share/fonts/
  cp fonts/* $HOME/.local/share/fonts/
fi

#Copy rofi themes
if ! [ -d $HOME/.local/share/rofi/themes ]; then
  mkdir -p $HOME/.local/share/rofi/themes/
  cp rofi/themes/* $HOME/.local/share/rofi/themes
fi

#Copy wallpapers
mkdir -p $HOME/.config/bg_images
cp wallpapers/* $HOME/.config/bg_images

#Install i3lock-fancy
git clone https://github.com/meskarune/i3lock-fancy
cd i3lock-fancy
sudo make install

cd $HOME
rm -rf $TMPDIR
