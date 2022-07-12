#!/bin/zsh

command -v tmux &> /dev/null

if [[ $? == 0 ]]
then
    if [[ -z "$TMUX" ]]
    then
        local SESSIONNAME="main"
        tmux has-session -t $SESSIONNAME &> /dev/null
        if [[ $? != 0 ]]
        then
            tmux new-session -s $SESSIONNAME -d
        fi
        tmux attach -t $SESSIONNAME
    else
        echo "[TMUX] you are in tmux environment"
        echo "[TMUX] session name: $(tmux display-message -p '#S')"
        echo "[TMUX] number of clients session is attached to: $(tmux display-message -p '#{session_attached}')"
    fi
else
    echo "[ERROR] command tmux not found"
fi