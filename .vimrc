" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
"Plug 'freeo/vim-kalisi'
"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'Lokaltog/vim-easymotion'
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular'
" Plug 'matchit.zip'
Plug 'vim-scripts/a.vim'
Plug 'xolox/vim-misc'
"Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-grepper'
Plug 'airblade/vim-gitgutter'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-dispatch'
Plug 'wellle/tmux-complete.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
"Plug 'jiangmiao/auto-pairs'
if has("nvim")
    "Plug 'SirVer/ultisnips'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'w0rp/ale'
    Plug 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }
else
    Plug 'Shougo/neocomplete.vim'
    Plug 'scrooloose/syntastic'
endif
Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'
Plug 'itchyny/vim-cursorword'
"Plug 'Yggdroot/indentLine'
"Plug 'Rip-Rip/clang_complete'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'vim-scripts/L9'
"Plugin 'bling/vim-bufferline.git'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Raimondi/delimitMate'
"Plug 'rhysd/vim-clang-format'
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'zchee/deoplete-jedi'

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
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"plugin related configs start here

nnoremap <F6> :NERDTreeToggle<CR>
nnoremap <F7> :UndotreeToggle<CR>
"nmap <F8> :TagbarToggle<CR>

nnoremap <c-p> :FZF<cr>
nnoremap <leader>l :BTags<cr>
nnoremap <leader>L :Tags<cr>
nnoremap <leader>f :BLines<cr>
nnoremap <leader>F :Lines<cr>
nnoremap <leader>b :Buffers<cr>

"emacs like shortcuts for yankstack
if has("nvim")
else
    set <m-p>=p   " rotate yanks forward
    set <m-P>=P   " rotate yanks forward
endif

"custom trigger for snippets
"let g:UltiSnipsExpandTrigger="<c-a>"

"syntastic checkers
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_checkers = ['pyflakes']
"let g:syntastic_python_checkers = ['pyflakes']
"let g:syntastic_python_checkers = ['pep8']

"let g:syntastic_jslint_checkers=['jslint']
"let g:syntastic_jslint_checkers=['jshint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"easytags stuff
"set tags=~/.vimtags
"let g:easytags_events = ['BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1
"""""

"vim-airline stuff
"uncomment for regular fonts
"let g:airline_powerline_fonts = 1

"show file name without the path
"let g:airline_section_c = '%t'

"disable whitespace check
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0

"show only column number and percentage
let g:airline_section_z = '%3p%% %3v'
let g:airline_theme = 'light'
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

"enable completion
if has("nvim")
    let g:deoplete#enable_at_startup = 1
else
    let g:neocomplete#enable_at_startup = 1
endif

command! -nargs=* -complete=file Rg GrepperRg <args>

let g:LanguageClient_serverCommands = {
            \ 'rust': ['rls'],
            \ 'python': ['pyls'],
            \ 'cpp': ['ccls', '--log-file=/tmp/cq.log'],
            \ 'c': ['ccls', '--log-file=/tmp/cq.log'],
            \ }

let g:LanguageClient_diagnosticsList="Location"
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '~/.vim/settings.json'
let g:LanguageClient_autoStart = 1
autocmd FileType c let g:LanguageClient_autoStart = 0

nnoremap <F9> :call LanguageClient_contextMenu()<CR>

autocmd FileType rust nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd FileType rust nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
autocmd FileType python nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
autocmd FileType python nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" AutoPairs stuff
let g:AutoPairsShortcutToggle = '<M-o>'
let g:AutoPairsMapCR=0

imap jk <Esc>
imap kj <Esc>

"let g:clang_use_library=1
"let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
"let g:clang_auto_user_options='compile_commands.json'
let NERDTreeIgnore=['\.o$', '\.so$', '\~$']

let g:ale_linters = {
            \   'rust': ['rls'],
            \}
imap <C-a>     <Plug>(neosnippet_expand_or_jump)
smap <C-a>     <Plug>(neosnippet_expand_or_jump)
xmap <C-a>     <Plug>(neosnippet_expand_target)
