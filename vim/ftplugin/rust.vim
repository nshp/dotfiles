""
" Rust config
" TODO: Move to ftplugin
"
au FileType rust nmap <C-]> <Plug>(rust-def)
au FileType rust nmap g<C-]> <Plug>(rust-def-split)
au FileType rust nmap g<S-C-]> <Plug>(rust-def-vertical)
au FileType rust nmap K <Plug>(rust-doc)
au FileType rust compiler cargo
au FileType rust set formatprg=rustfmt
"

