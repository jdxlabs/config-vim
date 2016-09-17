syntax on

" colorscheme
set background=dark
set t_Co=256
colorscheme smyck

" GUI
if has("gui_running")
    "set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guifont=Monospace\ 10
    set columns=127
    set lines=26
endif

" indentations
filetype plugin indent on  " show existing tab with 4 spaces width
set tabstop=4              " when indenting with '>', use 4 spaces width
set shiftwidth=4           " On pressing tab, insert 4 spaces
set expandtab

set nonu
set history=200

" NERDTree
"set mouse=a
"set hidden
"let NERDTreeWinSize = 38
"nnoremap <silent> <F3> :NERDTreeToggle<cr>

" custom mappings
"vmap <C-S-c> "+y
"map <C-S-v> "+p
"imap <C-S-v> <esc><C-S-v>
map bn :bn<cr>
map bp :bp<cr>
map bd :bp<bar>bd! #<cr>
map bl :buffers<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

