#!/bin/zsh

command -v tmux &> /dev/null

if [[ $? == 0 ]]
then
    local SESSIONNAME="main"
    tmux has-session -t $SESSIONNAME &> /dev/null
    if [[ $? != 0 ]]
    then
        tmux new-session -s $SESSIONNAME -d
    fi
    tmux attach -t $SESSIONNAME
else
    echo "command tmux not found"
fi