"" {{{ Directory structure and plugin loading
" Configuration for my config organization
set directory=$XDG_CONFIG_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME,/usr/share/vim/vimfiles
let $MYVIMRC="$XDG_CONFIG_HOME/vim/main.vim"

" Auto-load plugins from $VIMRUNTIME/bundle
execute pathogen#infect()

" Apply filetype-based indent rules and plugins
filetype plugin indent on

" Arch comes with some sensible defaults, might as well use them
runtime! archlinux.vim
" And so does vim itself
runtime! defaults.vim
" I like reading manpages in vim.
runtime! ftplugin/man.vim

" Load the matchit plugin (shipped with vim) for jumping to matching #ifs and
" #endifs and so on.
" Requires vim 8 for :packadd
packadd! matchit

" romainl's apprentice colorscheme, with a few changes for higher contrast
colorscheme apprentice

"" }}}
"" {{{ Settings
set expandtab                    " <tab> expans to spaces
set shiftwidth=4                 " 4 spaces for autoindent
set softtabstop=4                " <tab> inserts 4 spaces at a time
set autowrite                    " write before swapping buffers
set number                       " regular line numbers
set ttyfast                      " xterms and linux consoles are fast
set ttymouse=sgr                 " for mouse events in columns >233
set clipboard=unnamed            " default to the * register to share with X11
set undolevels=100000            " don't discard my undo tree
set undofile                     " persistent undo tree
set completeopt=menuone,noinsert " enter the completion popup, don't insert
set cscopequickfix=g-,s-         " use quickfix for cscope results
set smartcase ignorecase         " smartly ignore case in /search
set lazyredraw                   " don't redraw like crazy during macros
set browsedir=buffer             " :browse the current buffer's directory
" TODO: set cinoptions=:0        " for C, don't indent case statements
set list                         " turn on list mode to show invisible chars
set listchars=trail:-,tab:>-     " limit list to trailing whitespace and tabs
set tildeop                      " ~ becomes a real operator
set conceallevel=1               " conceal things if possible
"" }}}
"" {{{ Autocmds
" :make hooks to display the quickfix window automatically
autocmd QuickFixCmdPost [^l]* nested botright cwindow
"" }}}
"" {{{ Keybindings
let mapleader = "-"

" Directional split navigation
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

" Close
nmap <c-x> :bdel<cr>

" Quickfix and location list navigation
nmap ]q :cnext<cr>
nmap [q :cprev<cr>
nmap ]Q :clast<cr>
nmap [Q :cfirst<cr>
nmap ]l :lnext<cr>
nmap [l :lprev<cr>
nmap ]L :llast<cr>
nmap [L :lfirst<cr>
"" }}}
"" {{{ Functions
" PASTEBIN with pbpst
"
" Mappings:
"  <leader>p{motion}    Paste {motion} lines
"  <leader>pp           Paste entire buffer (same as gg<leader>pG)
"  <leader>p            (Visual) paste selection
"
" The pastebin URL is stored to the * register.
" With +X11, this is shared with the X primary selection (middle click or
" shift-insert to paste.)
function! Paste(type, ...)
    " Line-wise ranges
    if a:type == 'line' || a:type == 'V' || a:type == '%'
        if a:type == 'line'
            let start = "'["  " motion lines
            let end   = "']"
        elseif a:type == 'V'
            let start = "'<"  " visual lines
            let end   = "'>"
        else
            let start = 1     " entire file
            let end   = "$"
        endif
        let @* = systemlist('pbpst -S 2>/dev/null', getline(start, end))[0] . '/' . &filetype
    " Character-wise ranges
    elseif a:type == 'char' || a:type == 'v'
        if a:type == 'char'
            let start = "'["  " motion
            let end   = "']"
        else
            let start = "`<"  " visual
            let end   = "`>"
        endif
        let input = getline(start, end)
        let input[0]  = input[0][col(start):]
        let input[-1] = input[-1][:col(end)-1]
        let @* = systemlist('pbpst -S 2>/dev/null', input)[0] . '/' . &filetype
    " Block ranges (not handled)
    else
        echoerr "Paste: unsupported selection type: " . a:type
    endif
endfunction

nnoremap <leader>p :silent set opfunc=Paste<cr>g@
nnoremap <leader>pp :call Paste('%')<CR>
vnoremap <leader>p <esc>:call Paste(visualmode())<CR>
"" }}}
"" {{{ etc
" Slimv configuration for tmux
let g:slimv_browser_cmd = 'tmux split-window -h w3m'
let g:rust_conceal = 1
"" }}}
" vim:foldmethod=marker:foldlevel=0
