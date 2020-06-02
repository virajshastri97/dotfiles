#!/bin/zsh

# Include private bins if they exist
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin"

# Default programs
export EDITOR="vim"
export BROWSER="Google Chrome"

# ~ cleanup
export ZDOTDIR="$HOME/.config/zsh"
export VIMINIT="source $HOME/.config/vim/.vimrc"

# Setting PATH for Python 3.8
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH
