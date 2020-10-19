#!/bin/zsh

# Include private bins if they exist
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin"

# Default programs
export EDITOR="vim"
export BROWSER="Google Chrome"

# ~ cleanup
export ZDOTDIR="$HOME/.config/zsh"
export VIMINIT='let $MYVIMRC="$HOME/.config/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$HOME/.config/vim"

# Setting PATH for Python 3.8
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

# MacOS specific
# Disable the addition of ._foobar when using tar
COPYFILE_DISABLE=1
export COPYFILE_DISABLE
