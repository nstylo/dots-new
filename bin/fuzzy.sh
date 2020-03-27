#!/bin/bash

# Open file in vim through fzf
fv() {
    local -r file="$(fzf)"
    [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

# kill process using fuzzy finder
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}
