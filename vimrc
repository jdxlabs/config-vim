syntax on

set t_Co=256
set background=dark
colorscheme xoria256

if has("gui_running")
    set guifont=Dejavu\ Sans\ Mono\ 10
    set guioptions=acei
    set columns=175
    set lines=45
endif

filetype plugin indent on  " show existing tab with 4 spaces width
set tabstop=4              " when indenting with '>', use 4 spaces width
set shiftwidth=4           " On pressing tab, insert 4 spaces
set expandtab


