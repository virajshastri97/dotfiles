#!/bin/zsh

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return ;;
esac

# Enable colors:
autoload -U colors && colors

# for setting history length see HISTSIZE and HISTFILESIZE
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=${HOME}/.cache/zsh/.zsh_history

## Addition of the history file
setopt APPEND_HISTORY

## Ignore all repetitions of commands
setopt HIST_IGNORE_ALL_DUPS

## Do not display the string found earlier
setopt HIST_FIND_NO_DUPS

## Ignore rows if they are duplicates
setopt HIST_IGNORE_DUPS

## Delete empty lines from history file
setopt HIST_REDUCE_BLANKS

## Ignore a record starting with a space
setopt HIST_IGNORE_SPACE

## Do not add history and fc commands to the history
setopt HIST_NO_STORE

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit && compinit -i

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

[ -f $HOME/.config/aliases ] && source $HOME/.config/aliases
[ -f $HOME/.config/zsh/prompt ] && source $HOME/.config/zsh/prompt

# SSH login for CSU Workstations
csu() {
    if [ $# -eq 0 ];then
        open -a "Google Chrome" https://www.cs.colostate.edu/~info/cuda_machines.txt;
    elif [ $# -eq 1 ];then
        ssh -X virajs@$1.cs.colostate.edu;
    elif [ $# -eq 2 ];then
        ssh -X $1@$2.cs.colostate.edu;
    fi
}

csuj() {
    p=8888
    (( $# == 2 )) && p=$2
    ssh $p:localhost:$p -L virajs@$1.cs.colostate.edu
}

ta() {
    if [ $# -eq 0 ]; then
        csu cs253 salem;
    elif [ $# -gt 1 ]; then
        echo "Usage: $0 <machine-name>";
    else
        csu cs253 $1;
    fi
}

jn() {
    jupyter notebook --no-browser --port=$1
}

# CUDA paths
[ -d /usr/local/cuda-10.1 ] && export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/nsight-compute-2019.4.0${PATH:+:${PATH}}
[ -d /usr/local/cuda-10.1/lib64 ] && export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
