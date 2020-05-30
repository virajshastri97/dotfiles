#!/bin/sh

# Copying common files
copy () {
  cp $PWD/$1 ~/$1 && echo Copying $1
}

unset flist
flist=(".aliases" ".prompt" ".gitconfig" ".tmux.conf" ".vimrc" ".inputrc")

for f in ${flist[@]}; do
  [ -f ~/$f ] && mv ~/$f ~/$f.bkp
  copy $f
done

# Copying shell specific files
[[ $SHELL == *"zsh"* ]] && { copy ".zsh"; copy ".zprofile"; }
[[ $SHELL == *"bash"* ]] && { copy ".bashrc"; copy ".bash_profile"; }

# Copy alacritty config if using
read -p "Are you using alacritty (y/n): " -n 1 -r
echo
[[ $REPLY =~ ^[Yy]$ ]] && copy "alacritty.yml"
