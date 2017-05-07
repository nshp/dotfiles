KBDFILE=$ZDOTDIR/zkbd/$TERM-$VENDOR-$OSTYPE

[[ -f $KBDFILE ]]           && source $KBDFILE

[[ -n ${key[Left]} ]]       && bindkey "${key[Left]}"       backward-char
[[ -n ${key[Right]} ]]      && bindkey "${key[Right]}"      forward-char
[[ -n ${key[Backspace]} ]]  && bindkey "${key[Backspace]}"  backward-delete-char
[[ -n ${key[Delete]} ]]     && bindkey "${key[Delete]}"     delete-char
[[ -n ${key[Up]}   ]]       && bindkey "${key[Up]}"         up-line-or-search
[[ -n ${key[Down]} ]]       && bindkey "${key[Down]}"       down-line-or-search
[[ -n ${key[Home]} ]]       && bindkey "${key[Home]}"       beginning-of-line
[[ -n ${key[End]} ]]        && bindkey "${key[End]}"        end-of-line

# MOUSES
[[ -n ${key[ScrollUp]} ]]   && bindkey "${key[ScrollUp]}"   up-history
[[ -n ${key[ScrollDown]} ]] && bindkey "${key[ScrollDown]}" down-history

zle -N fuzzy-history fuzzy_history
bindkey '^R' fuzzy-history
zle -N fuzzy-dirstack fuzzy_dirstack
bindkey '^B' fuzzy-dirstack
