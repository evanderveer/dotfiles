#!/bin/bash

cd $HOME
TMPDIR=$(mktemp -d -t .)
mkdir $HOME/.local/bin

sudo apt install \
	gh \
	zsh \
	feh \
	kitty \
	rofi \
	nitrogen \
	stow \
	xorg \
	i3 \
	firefox-esr \
	polybar \
	picom

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
if ! [ -d $HOME/,local/share/rofi/themes ]; then
	mkdir -p $HOME/.local/share/rofi/themes/
	cp rofi/themes/* $HOME/.local/share/rofi/themes
fi

#Copy wallpapers
mkdir -p $HOME/.config/bg_images
cp wallpapers/* $HOME/.config/bg_images/

cd $HOME
rm -rf $TMPDIR
