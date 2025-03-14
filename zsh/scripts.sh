#!/usr/bin/env zsh

# using tar to compress a directory
compress() {
    tar cvzf $1.tar.gz $1
}

#lynx
ddg() {
    lynx -vikeys "https://lite.duckduckgo.com/lite/?q='$@'"
}

#for tmux
ftmuxp() {
    if [[ -n $TMUX ]]; then
        return
    fi

    # get the IDs
    ID="$(ls $XDG_CONFIG_HOME/tmuxp | sed -e 's/\.yml$//')"
    if [[ -z "$ID" ]]; then
        tmux new-session
    fi

    create_new_session="Create New Session"

    ID="${create_new_session}\n$ID"
    ID="$(echo $ID | fzf | cut -d: -f1)"

    if  [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session

    elif [[ -n "$ID" ]]; then
        tmuxp load "$ID"
    fi
}
