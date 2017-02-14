" Vim Compiler File
" Compiler: perlcritic
" Maintainer: Scott Peshak <speshak@gmail.com>
" Last Change: 2017 Feb 10

if exists("current_compiler")
finish
endif
let current_compiler = "perlcritic"

if exists(":CompilerSet") != 2 
command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

" nshp - bump severity up to 4, add --quiet
CompilerSet makeprg=perlcritic\ -verbose\ 1\ -4\ --quiet\ %
CompilerSet errorformat=%f:%l:%c:%m

let &cpo = s:cpo_save
unlet s:cpo_save
