# Custom prompt
source ~/.zsh/prompt.zsh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yantingyang/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yantingyang/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yantingyang/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yantingyang/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate py39