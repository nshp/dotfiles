EDITOR="ed -p:"
VISUAL=vim
SUDO_EDITOR="vim -Z"
MANPAGER="vim -M +MANPAGER -"
PAGER=vimpager
BROWSER=qutebrowser
TERMINAL=st
VIMINIT="let \$MYVIMRC = '$XDG_CONFIG_HOME/vim/main.vim' | source \$MYVIMRC"
VIMPAGER_RC="$XDG_CONFIG_HOME/vim/main.vim"
PERLDOC_PAGER=vimpager
PERLTIDY=$XDG_CONFIG_HOME/perltidy

export EDITOR VISUAL SUDO_EDITOR MANPAGER PAGER BROWSER TERMINAL VIMINIT PERLDOC_PAGER VIMPAGER_RC PERLTIDY
eval $(dircolors -b)
eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
