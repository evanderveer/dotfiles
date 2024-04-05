#!/bin/bash

cd $HOME
TMPDIR=$(mktemp -d -t .)

sudo apt install gh zsh feh kitty rofi nitrogen stow xorg i3 firefox polybar
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

cd $HOME
mkdir .config/bg_images
rm -rf $TMPDIR
