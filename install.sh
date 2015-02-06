#!/bin/sh

mkdir ~/.dotfiles
cp ./.bashrc ~/.dotfiles/
cp ./.gitlog ~/.dotfiles/
cp ./.gitignore ~/.dotfiles/
cp ./.git-completion.bash ~/.dotfiles

if [ -f ~/.bashrc ]; then
	mkdir ~/orgConfigure
	mv ~/.bashrc ~/orfConfigure 
	ln -s ~/.dotfiles/.bashrc ~/.bashrc
else
	ln -s ~/.dotfiles/.bashrc ~/.bashrc
fi

exit 0
