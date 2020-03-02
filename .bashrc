# Custom prompt, aliases
for file in ~/.{prompt,all_alias,inputrc,bash_completions,local_config}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
  complete -o default -o nospace -F _git g;
fi;

goto() {
    if [ $# -ne 1 ];then
	cd ~/Dev/;
    else
	cd ~/Dev/$1;
    fi
}

csu() {
    if [ $# -eq 0 ];then
        open -a "Google Chrome" https://www.cs.colostate.edu/~info/machines;
    elif [ $# -eq 1 ];then
        ssh -X virajs@$1.cs.colostate.edu;
    elif [ $# -eq 2 ];then
        ssh -X $1@$2.cs.colostate.edu;
    fi
}
