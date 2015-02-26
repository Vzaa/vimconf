set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/L9'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline.git'
Plugin 'honza/vim-snippets.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'bling/vim-bufferline.git'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript.git'
Plugin 'godlygeek/tabular'
Plugin 'morhetz/gruvbox'
Plugin 'wting/rust.vim'
Plugin 'tmhedberg/matchit'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/a.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""
set nocompatible

if &t_Co > 2 || has("gui_running")
	syntax on
endif

set t_Co=256

set history=10000
set wildmenu
set mouse=a
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set incsearch
set autoindent
set smartindent
set title
set hlsearch
set ls=2
set expandtab
set scrolloff=3
set nowrapscan

set encoding=utf-8
set fileencoding=utf-8

set undofile
set relativenumber
set number
set showmatch
set gdefault
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set hidden

filetype plugin indent on
filetype plugin on
set ofu=syntaxcomplete#Complete

let mapleader=","

noremap ^ 0
noremap 0 ^

nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :GundoToggle<CR>
nmap <F8> :TagbarToggle<CR>

map <leader>w bve"+y

map <leader>y "+y
map <leader>p "+p
map <leader><Right> $
map <leader><Left> ^
nnoremap <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>l :FufBufferTagAll<cr>

set nosplitright

set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set cst

if has("cscope")
    " add any database in current directory
    if filereadable(".kscope/cscope.out")
        cs add .kscope/cscope.out
    endif
endif


nnoremap <leader>r :cs find 0 <C-R>=expand("<cword>")<CR><CR>zz :cope<CR><CR>
nnoremap <leader>d :cs find 1 <C-R>=expand("<cword>")<CR><CR>zz :cope<CR><CR>
nnoremap <leader>v :cs find 3 <C-R>=expand("<cword>")<CR><CR>zz :cope<CR><CR>

nnoremap <leader>R :vert scs find 0 <C-R>=expand("<cword>")<CR><CR>zz :cope<CR><CR>
nnoremap <leader>D :vert scs find 1 <C-R>=expand("<cword>")<CR><CR>zz :cope<CR><CR>
nnoremap <leader>V :vert scs find 3 <C-R>=expand("<cword>")<CR><CR>zz :cope<CR><CR>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"nnoremap <C-b> <C-^>
nnoremap <space> <C-^>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap j gj
noremap k gk
noremap * *zz
noremap # #zz
noremap n nzz
noremap N Nzz
noremap ]] ]]zz
noremap [[ [[zz
noremap {{ {{zz
noremap }} }}zz
noremap <leader>o <C-w>o
"inoremap jk <esc>
"inoremap {<cr> {<ESC>o}<ESC>O

let g:UltiSnipsExpandTrigger="<c-a>"

let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_checkers = ['pyflakes']
"let g:syntastic_python_checkers = ['pyflakes']
"let g:syntastic_python_checkers = ['pep8']



set background=dark
colorscheme gruvbox

let g:clang_user_options='|| exit 0'
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"hi StatusLine ctermbg=green  ctermfg=black

" Maximize quickfix windows' width
function! MaxQuickfixWin()
    if &buftype ==# "quickfix"
        execute "normal! \<c-w>J"
    endif
endfunction
augroup MaxQuickfixWinGrp
    autocmd!
    autocmd BufWinEnter * call MaxQuickfixWin()
augroup END

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

highlight Highlighted ctermfg=231 ctermbg=24 cterm=NONE
highlight! link CursorLineNr Highlighted

set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
