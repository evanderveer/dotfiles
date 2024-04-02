#!/bin/bash

cd $HOME
TMPDIR=$(mktemp -d -t .)

sudo apt install git gh zsh feh kitty rofi nitrogen

if ! command -v nvim &>/dev/null; then
	#Install Neovim
	sudo apt install cmake ninja-build gettext curl unzip build-essential
	git clone https://github.com/neovim/neovim
	cd neovim
	make CMAKE
fi

#Get dotfiles
git clone https://github.com/evanderveer/dotfiles $HOME/.dotfiles

cd $HOME
rm -rf $TMPDIR
