syntax on

" colorscheme
set t_Co=256
set background=dark
colorscheme smyck

" GUI
if has("gui_running")
    set guioptions=acei
    set guifont=Dejavu\ Sans\ Mono\ 9
    set columns=170
    set lines=55
endif

" indentations
filetype plugin indent on  " show existing tab with 4 spaces width
set tabstop=4              " when indenting with '>', use 4 spaces width
set shiftwidth=4           " On pressing tab, insert 4 spaces
set expandtab

set nu

" NERDTree
set mouse=a
let NERDTreeWinSize = 35
nnoremap <silent> <F3> :NERDTreeToggle<cr>

