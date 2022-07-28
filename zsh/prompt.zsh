# time
current_time () {
    local output="%B%F{cyan}[$(date +%H:%M:%S)]%f%b"
    echo "$output"
}

current_time_ms() {
    local time_ms
    if [[ "$OSTYPE" == "linux-gnu" ]]
    then
        # Linux
        time_ms="$(date +%s.%3N)"
    elif [[ "$OSTYPE" == "darwin"* ]]
    then
        # macOS
        time_ms="$(gdate +%s.%3N)";
    else
        # Unknown.
    fi
    echo "$time_ms"
}

format_time() {
    local time_ms
    if [[ "$OSTYPE" == "linux-gnu" ]]
    then
        # Linux
        time_ms="$(date -u -d @$1 +"%T.%3N")"
    elif [[ "$OSTYPE" == "darwin"* ]]
    then
        # macOS
        time_ms="$(gdate -u -d @$1 +"%T.%3N")";
    else
        # Unknown.
    fi
    echo "$time_ms"
}

# directory
directory() {
    # REF: https://stackoverflow.com/questions/25944006/bash-current-working-directory-with-replacing-path-to-home-folder
    local output=" %B%F{cyan}[${PWD/#$HOME/~}]%f%b"
    echo "$output"
}

# username and hostname
user_host() {
    local output
    output=" %B%F{green}%n@%m%f%b"
    echo "$output"
}

precmd() {
    # last_cmd
    local last_cmd_return_code=$?
    if $first_prompt
    then
        first_prompt=false
        return 0
    fi
    COMMAND_TIME_END="$(current_time_ms)"
    cost=$(($COMMAND_TIME_END-$COMMAND_TIME_BEGIN))
    cost=$(format_time $cost)
    if [[ "$last_cmd_return_code" = "0" ]]
    then
        echo ${(%):-"%B%F{green}❱❱❱ [cost $cost] %f%b"}
        echo ""
    else
        echo ${(%):-"%B%F{red}❱❱❱ [cost $cost] %f%b"}
        echo ""
    fi
}

preexec() {
    COMMAND_TIME_BEGIN="$(current_time_ms)";
}

# https://stackoverflow.com/questions/59558252/make-zsh-prompt-update-each-time-a-command-is-executed
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='$(current_time)$(directory)$(user_host) $NEWLINE> '
first_prompt=true