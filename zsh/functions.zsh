function mpod {
    mcpan pod $1 | $PAGER -c 'set ft=perldoc'
}

function msrc {
    mcpan src $1 | $PAGER -c 'set ft=perl'
}

function scratch {
    local tmp
    tmp=$(mktemp --suffix=.$1)
    vim -c 'set ft='$1 $tmp
    rm $tmp
}

function note {
    local note
    pushd
    cd ~/notes
    note=(${(@f)$(fzf --print-query)})
    if [[ -f $note[2] ]]; then
        $VISUAL $note[2]
    else
        $VISUAL $note[1]
    fi
    popd
}

function fuzzy_history {
    local choice
    choice=($(fc -l 0 | fzf --tac --no-sort))
    [[ $#choice -gt 1 ]] || return
    HISTNO=$(sed 's/[^\d]//g' <<< $choice[1])
    BUFFER=$choice[2,-1]
}

function fuzzy_dirstack {
    local choice
    choice=$(dirs -pl | fzf --tac --no-sort)
    [[ -n $choice ]] && cd $choice
    zle .reset-prompt
}
