"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts list :
"   * Functions
"       F1 - Show help
"       F2 - Unactive search highlight
"       F3 - NERDTree
"       F4   Paste toggle
"       F6 - Spellchecking English
"       F7 - Spellchecking French
"       F8 - Unactive Spellchecking
"
"   * Windows
"       Ctrl-h - To the left
"       Ctrl-j - To the bottom
"       Ctrl-k - To the top
"       Ctrl-l - To the right
"
"   * Buffers
"       TAB - Next buffer
"       Ctrl-TAB - Previous buffer
"
"   * Others
"       Ctrl-Space - Intelligent completion
"       <leader>s - Reload .vimrc
"       <leader>e - Edit .vimrc
"       <leader>w - Save file
"       <leader>l - Show/hide invisible characters
"       <leader>t - Show tasks list
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Bundles list
Bundle 'kien/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'joshdick/onedark.vim'
Bundle 'sheerun/vim-polyglot'

call vundle#end()            " required
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set history=400
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp1252
set viminfo='20,\"500,h
set backspace=indent,eol,start

" Define mapleader
let mapleader = ","
let g:mapleader = ","

" Handle .vimrc
nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>e :e! ~/.vimrc<cr>

set pastetoggle=<F4>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu              " Show line numbers
set numberwidth=1   " Width for line numbers
set ruler           " Show cursor position
set shm=tToOIA      " Text formatting
set showmode        " Show current mode
set showcmd         " Displays incomplete commands
set wildmenu        " Menu for completing commands
set wildmode=list:longest
set wildignore=CVS,.svn,.git,*.o,*.bak,*.pyc,*.swp,*.jpg,*.gif,*.png

set noerrorbells " Unactive sound
set visualbell t_vb=
autocmd GUIEnter * set vb t_vb=

set laststatus=2
set statusline=%<%F\ %m%r%y[%{&fenc}][%{&ff}]%=\ %n\ %l/%L,%c%V\ %P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
syntax on
syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart

set t_Co=256
set background=dark

colorscheme onedark

if has("gui_running")
    set guifont=Dejavu\ Sans\ Mono\ 9
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set columns=185
    set lines=80
endif

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation - Tab management / spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent

set smarttab        " 'shiftwidth' at line start, '(soft)tabstop' elsewhere
set expandtab       " Use spaces insteed of tabs
set tabstop=4       " when indenting with '>', use n spaces width
set softtabstop=4   " n spaces for a tab in editing mode
set shiftwidth=4    " On pressing tab, insert n spaces
set shiftround      " Tabs are always multiples of shiftwidth (<<, >>)

" Display of invisible characters
set list listchars=tab:»\ ,
"set list listchars=tab:»\ ,eol:¬
nmap <leader>l :set list!<cr>

" Automatically removes end-of-line spaces
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
    " First, save last search and current position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Second, do the job
    %s/\s\+$//e
    " Third, restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Edition
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nostartofline   " Keep the column
set showmatch       " Shows the corresponding bracket or parenthesis
set matchtime=2     " For n tenths of a second
set matchpairs=(:),[:],{:},<:>
set scrolloff=2

" Quicksave
nmap <leader>w :w!<cr>

" Spellchecking
nnoremap <F6> :setlocal spell spelllang=en<cr>
nnoremap <F7> :setlocal spell spelllang=fr<cr>
nnoremap <F8> :setlocal nospell<cr>

let sh_fold_enabled=1 " shell fold setting

" Intelligent completion
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

inoremap <c-space> <c-x><c-o> " Keyboard shortcut for omnifunc keyboard

set diffopt=filler,iwhite,vertical " Options for diff mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable      " Active folding
set foldlevel=100   " Level of opened folds
set foldmarker={,}
set foldmethod=marker
set foldcolumn=0    " No left margin for folds

" Retrieves selection after indentation shift
vnoremap <silent> < <gv
vnoremap <silent> > >gv

autocmd FileType python setlocal foldmethod=indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch        " Search highlight
set incsearch       " Incremental search

set ignorecase      " Case insensitive search
set smartcase       " ... unless the search contains capital letters

nnoremap <silent> <F2> :silent noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Buffers / Windows / Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden          " To be able to change the buffer without saving
set wmh=0           " Minimum number of lines for a window
set splitright      " New window on the right (:vsp)

" Moving between windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" Moving between buffers
noremap <tab> :bn!<cr>
noremap <S-tab> :bp!<cr>
map bd :bp<bar>bd! #<cr>
map bl :buffers<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files / Backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set acd             " Go to the directory of the file being edited
set autoread        " Auto-Reload when a file is modified
set autowrite       " Auto-Save when leaving or changing buffer

" see ':help backup'
set nobackup
set writebackup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap

" Set the current directory to the current buffer
autocmd BufEnter * :lcd %:p:h
set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeWinSize = 40
nnoremap <silent> <F3> :NERDTreeToggle<cr>

" NERD_commenter
let NERDAllowAnyVisualDelims = 1
let NERDSpaceDelims = 1

" Task list
nmap <leader>t <Plug>TaskList
let g:tlWindowPosition = 1
let g:tlTokenList = ['FIXME','TODO','XXX']
let g:tlRememberPosition = 1

" Vorax
let g:vorax_dbexplorer_side = 1
let g:vorax_dbexplorer_width = 40

" Vim-airline
let g:airline_powerline_fonts=1 " Let airline plugin use the arrow effect of powerline
let g:airline_theme="onedark"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
