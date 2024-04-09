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
	picom \
	lightdm

chsh -s /bin/zsh

if ! command -v nvim &>/dev/null; then
	#Install Neovim
	sudo apt install cmake ninja-build gettext curl unzip build-essential
	git clone https://github.com/neovim/neovim
	cd neovim
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
fi

if ! command -v code &>/dev/null; then
	sudo apt-get install wget gpg
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	sudo apt install apt-transport-https
	sudo apt update
	sudo apt install code
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
