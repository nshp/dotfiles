""
" Rust config
"
nmap <buffer> <C-]> <Plug>(rust-def)
nmap <buffer> g<C-]> <Plug>(rust-def-split)
nmap <buffer> g<S-C-]> <Plug>(rust-def-vertical)
nmap <buffer> K <Plug>(rust-doc)
compiler cargo
setl formatexpr=rustfmt#FormatRange()
"

