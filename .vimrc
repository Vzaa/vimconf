set nocompatible

if &t_Co > 2 || has("gui_running")
	syntax on
endif

set t_Co=256
"set background=dark
colorscheme inkpot
"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

set history=10000
set wildmenu
set mouse=a
set ignorecase smartcase
"set number
set tabstop=2
set shiftwidth=2
set incsearch
set autoindent
set smartindent
set title
set hlsearch
set ls=2
set expandtab
set scrolloff=3

set undofile
set relativenumber
set cursorline
set showmatch
set gdefault
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wildmode=longest,list
set hidden

filetype plugin indent on
filetype plugin on
set ofu=syntaxcomplete#Complete

let mapleader=","

map <leader>y "+y
map <leader>p "+p
nnoremap <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


nnoremap <C-b> <C-^>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set dictionary+=~/.vim/verilogkeywords
