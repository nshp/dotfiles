PROMPT='%F{249}%D{%H}%F{245}%D{%M}%F{242}%D{%S} %F{red}%n%f@%F{blue}%m%f %F{yellow}%1~%f %(!.#.$) '

FCEDIT=$VISUAL
HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=10000
SAVEHIST=10000000
REPORTTIME=60

fpath=($ZDOTDIR/Functions $fpath)
path=($HOME/bin /usr/bin/vendor_perl /usr/bin/core_perl $path)

# Expand ~zsh to $ZDOTDIR
hash -d zsh=$ZDOTDIR
# Same for vim
hash -d vim=$XDG_CONFIG_HOME/vim
