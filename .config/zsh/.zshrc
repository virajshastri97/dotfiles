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

# Basic auto tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -i
_comp_options+=(globdots)

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
[ -f $HOME/.config/shortcuts ] && source $HOME/.config/shortcuts
[ -f $HOME/.config/zsh/prompt ] && source $HOME/.config/zsh/prompt


# CUDA paths
[ -d /usr/local/cuda-10.1 ] && export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/nsight-compute-2019.4.0${PATH:+:${PATH}}
[ -d /usr/local/cuda-10.1/lib64 ] && export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
