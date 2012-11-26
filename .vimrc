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
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set wildmode=longest,list
set hidden

filetype plugin indent on
filetype plugin on
set ofu=syntaxcomplete#Complete

let mapleader=","

map <leader>y "+y
map <leader>p "+p
map <leader><Right> $
map <leader><Left> ^
nnoremap <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

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
noremap <leader>o <C-w>o
inoremap jk <esc>

augroup filetype_verilog
  autocmd!
  autocmd filetype verilog set dictionary+=~/.vim/verilogkeywords
augroup END

"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
"nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
"vnoremap <leader>g :<C-U>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    echom @@
endfunction


nnoremap <leader>b :call ToBin(expand("<cword>"))<cr>


function! ToBin(no)
  let yankold = @@
  let temp = a:no * 1
  let nextchar = 0
  let str = ""
  while temp != 0
    let nextchar = temp % 2
    let temp = temp / 2
    let str = nextchar . str
  endwhile
  execute "normal! ciw".str
  let @@ = yankold
endfunction


let g:clang_user_options='|| exit 0'
