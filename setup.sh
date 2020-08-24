#!/bin/sh

# Creating symlink for config files
ln -s ~/Dev/dotfiles/.config ~/.config && echo Creating config files symlink

# Creating shell specific symlink
[[ $SHELL == *"zsh"* ]] && ln -s ~/Dev/dotfiles/.zprofile ~/.zprofile && echo Creating zprofile symlink
[[ $SHELL == *"bash"* ]] && ln -s ~/Dev/dotfiles/.bash_profile ~/.bash_profile && echo Creating bash profile symlink
