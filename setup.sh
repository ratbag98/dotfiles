#!/bin/env bash

ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/gitignore .gitignore
ln -s dotfiles/githelpers .githelpers
ln -s dotfiles/config .config
ln -s dotfiles/tool-versions .tool-versions
ln -s dotfiles/default-mix-commands .default-mix-commands
mkdir -p ~/.git_template

case "$OSTYPE" in 
	darwin*) echo "Linking Mac-specific files"
		ln -s dotfiles/mac_only/Brewfile Brewfile ;;
	*) echo "Nothing specific for $OSTYPE" ;;
esac
