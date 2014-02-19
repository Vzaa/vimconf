set nocompatible

if &t_Co > 2 || has("gui_running")
	syntax on
endif

set t_Co=256
"set background=dark
colorscheme inkpot
"colorscheme gentooish
"colorscheme jellybeans
"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }

set history=10000
set wildmenu
set mouse=a
set ignorecase smartcase
"set number
set tabstop=4
set shiftwidth=4
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
"hi CursorColumn cterm=none ctermbg=black
hi CursorLine cterm=none ctermbg=black
set cursorline
"set cursorcolumn
set showmatch
set gdefault
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set wildmode=longest,list
set hidden

filetype plugin indent on
filetype plugin on
set ofu=syntaxcomplete#Complete

let mapleader=","


execute pathogen#infect()

"let g:clang_library_parth="/usr/lib"
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

noremap ^ 0
noremap 0 ^

nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :GundoToggle<CR>

map <leader>w bve"+y

map <leader>y "+y
map <leader>p "+p
map <leader><Right> $
map <leader><Left> ^
nnoremap <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

set nosplitright

nnoremap <leader>r :cs find 0 <C-R>=expand("<cword>")<CR><CR>zz
nnoremap <leader>d :cs find 1 <C-R>=expand("<cword>")<CR><CR>zz
nnoremap <leader>v :cs find 3 <C-R>=expand("<cword>")<CR><CR>zz

nnoremap <leader>R :vert scs find 0 <C-R>=expand("<cword>")<CR><CR>zz
nnoremap <leader>D :vert scs find 1 <C-R>=expand("<cword>")<CR><CR>zz
nnoremap <leader>V :vert scs find 3 <C-R>=expand("<cword>")<CR><CR>zz

"nnoremap <leader>r :vert rightb scs find 0 <C-R>=expand("<cword>")<CR><CR>zz
"nnoremap <leader>d :vert rightb scs find 1 <C-R>=expand("<cword>")<CR><CR>zz
"nnoremap <leader>c :vert rightb scs find 3 <C-R>=expand("<cword>")<CR><CR>zz

"nnoremap <leader>r <C-W><C-O>:vert rightb scs find 0 <C-R>=expand("<cword>")<CR><CR>zz
"nnoremap <leader>d <C-W><C-O>:vert rightb scs find 1 <C-R>=expand("<cword>")<CR><CR>zz
"nnoremap <leader>c <C-W><C-O>:vert rightb scs find 3 <C-R>=expand("<cword>")<CR><CR>zz


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
inoremap {<cr> {<ESC>o}<ESC>O
"inoremap (<space> (<space>)<ESC>i
"inoremap "" ""<ESC>i


augroup filetype_verilog
  autocmd!
  autocmd filetype verilog set dictionary+=~/.vim/verilogkeywords
  autocmd filetype verilog inoremap begin<cr> begin<cr>end<esc>O
augroup END

augroup filetype_tex
  autocmd!
  autocmd filetype tex nnoremap <F5> :make<cr>:!gnome-open<space>rep.pdf<cr>:redraw!<cr>
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
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"hi StatusLine ctermbg=green  ctermfg=black

