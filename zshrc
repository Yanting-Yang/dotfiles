# Custom prompt
source ~/.zsh/prompt.zsh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# <<< conda initialize <<<

if command -v conda &>/dev/null
then
    if [ -n "$(conda env list|grep py39)" ]
    then
        conda activate py39
    fi
else
    if [ -f ~/opt/miniconda3/bin/conda ]
    then
        ~/opt/miniconda3/bin/conda init zsh
    fi
    if [ -f ~/miniconda3/bin/conda ]
    then
        ~/miniconda3/bin/conda init zsh
    fi
fi


source ~/.zsh/tmux.zsh