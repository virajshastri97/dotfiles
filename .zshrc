# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return ;;
esac

# Enable colors:
autoload -U colors && colors	# Load colors

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
setopt histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**'

# Initialize the autocompletion
autoload -Uz compinit && compinit -i

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.prompt ] && source ~/.prompt
[ -f ~/.inputrc ] && source ~/.inputrc

# SSH login for CSU Workstations
csu() {
    if [ $# -eq 0 ];then
        open -a "Google Chrome" https://www.cs.colostate.edu/~info/machines;
    elif [ $# -eq 1 ];then
        ssh -X virajs@$1.cs.colostate.edu;
    elif [ $# -eq 2 ];then
        ssh -X $1@$2.cs.colostate.edu;
    fi
}

# Add your local configs here
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# CUDA paths
[ -d /usr/local/cuda-10.1 ] && export PATH=/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/nsight-compute-2019.4.0${PATH:+:${PATH}}
[ -d /usr/local/cuda-10.1/lib64 ] && export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
