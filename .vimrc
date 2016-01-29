set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/L9'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'honza/vim-snippets.git'
Plugin 'scrooloose/nerdcommenter.git'
"Plugin 'bling/vim-bufferline.git'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript.git'
Plugin 'godlygeek/tabular'
Plugin 'morhetz/gruvbox'
Plugin 'rust-lang/rust.vim'
Plugin 'tmhedberg/matchit'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/a.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'wellle/tmux-complete.vim'
"Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ntpeters/vim-better-whitespace'

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
set wildmode=longest:full,full
set mouse=a
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set incsearch
set autoindent
"set smartindent
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

map <leader>y "+y
map <leader>p "+p
nnoremap <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>l :CtrlPBufTagAll<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

set nosplitright

set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set cst

if has("cscope")
    " add any database in current directory
    if filereadable(".kscope/cscope.out")
        cs add .kscope/cscope.out
    endif
endif


nnoremap <leader>r :cs find 0 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>d :cs find 1 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>v :cs find 3 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>

nnoremap <leader>R :vert scs find 0 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>D :vert scs find 1 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>V :vert scs find 3 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>t :!rm -r .kscope; ~/newscope.sh ./<cr>:cs reset<cr>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap <space> <C-^>
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l

cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

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
set <m-p>=p   " rotate yanks forward
set <m-P>=P   " rotate yanks forward

let g:UltiSnipsExpandTrigger="<c-a>"

let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_checkers = ['pyflakes']
"let g:syntastic_python_checkers = ['pyflakes']
"let g:syntastic_python_checkers = ['pep8']

"let g:syntastic_jslint_checkers=['jslint']
let g:syntastic_jslint_checkers=['jshint']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

set background=dark
colorscheme gruvbox

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

"easytags stuff
set tags=~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
"""""

"vim-airline stuff
"uncomment for regular fonts
let g:airline_powerline_fonts = 1

"show file name without the path
let g:airline_section_c = '%t'

"disable whitespace check
let g:airline#extensions#whitespace#enabled = 0

"show only column number and percentage
let g:airline_section_z = '%3p%% %3v'
let g:airline_theme = 'wombat'
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
"""""


"disable new line comments with o
autocmd FileType * setlocal formatoptions-=o

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

"ignore whitespace in diffs
set diffopt+=iwhite

"reduce ESC delay
set timeout           " for mappings
set timeoutlen=1000   " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value
