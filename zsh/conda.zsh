#!/bin/zsh

command -v conda &> /dev/null

if [[ $? == 0 ]]
then
    echo which conda
else
    echo "command conda not found"
fi