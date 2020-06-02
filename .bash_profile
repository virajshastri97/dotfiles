#!/bin/bash

# Include private bins if they exist
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin"

# Default programs
export EDITOR="vim"

# ~ cleanup
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$HOME/.config/vim"

[ -n "$PS1" ] && source $HOME/.config/bash/.bashrc
