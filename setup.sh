#!/bin/sh

# Copying common files
copy () {
  cp $PWD/$1 ~/$1 && echo Copying $1
}

cp -r .config $HOME/ && echo Copying config dir

# Copying shell specific files
[[ $SHELL == *"zsh"* ]] && copy ".zprofile"
[[ $SHELL == *"bash"* ]] && copy ".bash_profile"
