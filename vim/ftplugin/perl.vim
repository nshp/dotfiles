setl formatprg=perltidy\ -q
" Indent-only perltidy for ==
setl equalprg=perltidy\ -q\ -io
" Linting with :make
compiler perlcritic
