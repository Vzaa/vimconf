call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Plugins
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-grepper'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/a.vim'
Plug 'wellle/tmux-complete.vim'

" Language specific plugins
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

" Old stuff
"Plug 'godlygeek/tabular'
"Plug 'Lokaltog/vim-easymotion'
"Plug 'tpope/vim-dispatch'
"Plug 'jiangmiao/auto-pairs'
"Plug 'itchyny/vim-cursorword'

call plug#end()
"""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""
set nocompatible

if &t_Co > 2 || has("gui_running")
    syntax on
endif

"256 color terminal
set t_Co=256

"longer history
set history=10000

"better commandline
set wildmenu

"proper tab completion behavior in command line
set wildmode=longest:full,full
"ignore binary files
set wildignore+=*.o,*.a,*.so,*.class

"make gf recursive
set path+=**

"mouse support
set mouse=a

"case sensitive search when there's a capital letter
set ignorecase smartcase

"tab/space stuff, insert 4 spaces with tab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set et
"set textwidth=80

if has("nvim")
    set icm=nosplit
endif

"highlight tabs as >--, and trailing whitespace with -, spaw with .
set listchars=tab:>-,trail:-
set list

"buffers remember their states
set hidden

"search as it's being typed
set incsearch

"highlight search matches
set hlsearch

"s/././g by default
set gdefault

"do not wrap searches at the end of the files
set nowrapscan

"relative line numbers
set relativenumber
set number

set autoindent
"set smartindent

"indent changes in C
set cinoptions=:0,l1,t0,g0,(0

set title
set ls=2

"start scrolling at 3rd row
set scrolloff=3

"default encoding
set encoding=utf-8
set fileencoding=utf-8

"show matching brackets as they're inserted
set showmatch

"preserve undo states, backup and undo files are kept in a single dir
set undofile
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"make vim more responsive
set lazyredraw
set ttyfast

"manual folding
set foldmethod=manual

"reduce ESC delay
set timeout           " for mappings
set timeoutlen=1000   " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value

"ignore whitespace in diffs (messes up Gdiff)
"set diffopt+=iwhite

filetype plugin indent on
filetype plugin on
set ofu=syntaxcomplete#Complete

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"config cscope
set nosplitright
set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
set cst

if has("cscope")
    " add any database in current directory
    if filereadable(".kscope/cscope.out")
        cs add .kscope/cscope.out
        set tags+=.kscope/tags
    endif
endif

"custom mappings
let mapleader=","

"swap 0 and ^ behavior
noremap ^ 0
noremap 0 ^

"copy/paste clipboard
map <leader>y "+y
map <leader>p "+p

"disable highlight
nnoremap <leader><space> :noh<cr>
"remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"cscope mappings
nnoremap <leader>r :cs find 0 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>d :cs find 1 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>v :cs find 3 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>

nnoremap <leader>R :vert scs find 0 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>D :vert scs find 1 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>V :vert scs find 3 <C-R>=expand("<cword>")<CR><CR>z<CR> :cope<CR><CR>
nnoremap <leader>t :!rm -r .kscope; ~/newscope.sh ./<cr>:cs reset<cr>

"disable f1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"switch between last buffer with space
nnoremap <space> <C-^>

"c-hjkl to move between splits
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l

"shortcut for closing other splits
noremap <leader>o <C-w>o

"better command mode behavior for c-n and c-p
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

"move visually correct when line is wrapped
noremap j gj
noremap k gk

"center after certain movements
noremap * *zz
noremap # #zz
"n always moves forward
noremap <expr> n (v:searchforward ? 'nzz' : 'Nzz')
noremap <expr> N (v:searchforward ? 'Nzz' : 'nzz')
noremap ]] ]]zz
noremap [[ [[zz
noremap { {{zz
noremap } }}zz
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

if has("nvim")
    tnoremap <Esc> <C-\><C-n>
endif

"jk to go to normal mode
"inoremap jk <esc>

"disable new line comments with o
autocmd FileType * setlocal formatoptions-=o

"colorscheme set
set background=dark
colorscheme gruvbox

"highlight current line number with a different color
highlight Highlighted ctermfg=231 ctermbg=24 cterm=NONE
highlight! link CursorLineNr Highlighted

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

"auto close info buffer thing after completion
autocmd CursorMovedI * if !bufexists("[Command Line]") && pumvisible() == 0|pclose|endif
autocmd InsertLeave * if !bufexists("[Command Line]") && pumvisible() == 0|pclose|endif

"plugin related configs start here

nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :UndotreeToggle<CR>

nnoremap <c-p> :Files<cr>
nnoremap <leader>l :BLines<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>g :Rgg<cr>
nnoremap <leader>c :Rgc<cr>


" ripgrep stuff
command! -bang -nargs=* Rgg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rgc
  \ call fzf#vim#grep(
  \   'rg -tc --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -nargs=* -complete=file Rg GrepperRg <args>

if has("nvim")
else
"emacs like shortcuts for yankstack
    set <m-p>=p   " rotate yanks forward
    set <m-P>=P   " rotate yanks forward
endif


imap jk <Esc>
imap kj <Esc>

let NERDTreeIgnore=['\.o$', '\.so$', '\~$']

command! PrettyPrintJSON %!python3 -m json.tool

"CoC Stuff

"custom trigger for snippets
imap <C-a> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

set cmdheight=2

" lightline cfg
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
