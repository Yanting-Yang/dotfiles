# Get conda info
precmd_conda_info() {
    if [[ -n $CONDA_PREFIX ]];
    then
        if [[ $(basename $CONDA_PREFIX) == "miniconda3" ]]; then
            CONDA_ENV="(base)"
        else
            CONDA_ENV="($(basename $CONDA_PREFIX))"
        fi
    else
        CONDA_ENV=""
    fi
}

# Disable virtualenv prompt
# https://virtualenv.pypa.io/en/legacy/reference.html#envvar-VIRTUAL_ENV_DISABLE_PROMPT
export VIRTUAL_ENV_DISABLE_PROMPT=1
# Get venv info
precmd_venv_info() {
    if [[ -n $VIRTUAL_ENV ]];
    then
        VENV_ENV="($(basename $VIRTUAL_ENV))"
    else
        VENV_ENV=""
    fi
}

# prompt
prompt () {
    NEWLINE=$'\n'

    # start boldface mode and black foreground colour
    left="%B%F{white}"
    left_content=""
    # time
    left+="%K{green} [%*] "
    left_content+=" [%*] "
    # current working directory
    left+="%K{magenta} %~ "
    left_content+=" %~ "
    # length of left
    left_length=${#${(%)left_content}}

    right="%K{green}"
    right_content=""
    # conda env
    if [[ -n ${CONDA_ENV} ]];
    then
        right+=" ${CONDA_ENV} "
        right_content+=" ${CONDA_ENV} "
    fi
    # venv
    if [[ -n ${VENV_ENV} ]];
    then
        right+=" ${VENV_ENV} "
        right_content+=" ${VENV_ENV} "
    fi
    # stop boldface mode, black foreground colour and background colour
    right+="%k%f%b"
    right_content+=""
    # length of right
    right_length=${#${(%)right_content}}

    #PROMPT="%K{green}${left}${NEWLINE}%k> ${CONDA_ENV}"
    PROMPT="${left}${(l:COLUMNS-left_length-right_length:)}${right}${NEWLINE}> "
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd_conda_info
add-zsh-hook precmd precmd_venv_info
add-zsh-hook precmd prompt