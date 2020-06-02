#!/bin/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Custom aliases, prompt and some autocomplete settings
[ -f $HOME/.config/aliases ] && source $HOME/.config/aliases
[ -f $HOME/.config/bash/prompt ] && source $HOME/.config/bash/prompt
[ -f $HOME/.config/bash/inputrc ] && source $HOME/.config/bash/inputrc

csu() {
    if [ $# -eq 0 ];then
        open -a "Google Chrome" https://www.cs.colostate.edu/~info/machines;
    elif [ $# -eq 1 ];then
        ssh -X virajs@$1.cs.colostate.edu;
    elif [ $# -eq 2 ];then
        ssh -X $1@$2.cs.colostate.edu;
    fi
}

# CUDA paths
[ -d /usr/local/cuda-10.1 ] && export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/nsight-compute-2019.4.0${PATH:+:${PATH}}
[ -d /usr/local/cuda-10.1/lib64 ] && export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
