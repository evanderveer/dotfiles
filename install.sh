#!/bin/bash

cd $HOME
TMPDIR=$(mktemp -d -t .)

sudo apt install gh zsh feh kitty rofi nitrogen

if ! command -v nvim &>/dev/null; then
	#Install Neovim
	sudo apt install cmake ninja-build gettext curl unzip build-essential
	git clone https://github.com/neovim/neovim
	cd neovim
	make CMAKE
fi

#Link dotfiles

cd $HOME
rm -rf $TMPDIR
