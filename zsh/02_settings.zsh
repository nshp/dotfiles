# Changing Directories
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent
# Completion
setopt glob_complete
setopt list_packed
# Expansion and Globbing
unsetopt case_glob
setopt extended_glob
setopt glob_star_short
setopt magic_equal_subst
setopt warn_create_global
# History
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt share_history
# Input/Output
setopt interactive_comments
setopt print_exit_value
# Job Control
setopt auto_continue
setopt long_list_jobs
# Scripts and Functions
setopt c_bases 
setopt c_precedences
setopt local_loops
setopt pipe_fail
# Shell Emulation
setopt csh_junkie_loops
# Zle
unsetopt beep
