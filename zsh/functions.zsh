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
