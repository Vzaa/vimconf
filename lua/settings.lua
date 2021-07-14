--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.cmd [[colorscheme gruvbox]]

--Set statusbar
vim.g.lightline = {
  colorscheme = 'gruvbox',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

--Save undo history
vim.cmd [[set undofile]]
vim.cmd [[set backup]]
vim.cmd [[set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp]]
vim.cmd [[set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp]]
vim.cmd [[set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp]]

-- do not wrap searches at the end of the files
vim.cmd [[set nowrapscan]]
-- start scrolling at 3rd row
vim.cmd [[set scrolloff=3]]
--highlight tabs as >--, and trailing whitespace with -, spaw with .
vim.cmd [[set listchars=tab:>-,trail:-]]
vim.cmd [[set list]]
-- Y dis not work
vim.cmd [[highlight Highlighted ctermfg=231 ctermbg=24 cterm=NONE]]
vim.cmd [[highlight! link CursorLineNr Highlighted]]
-- Rg/PrettyPrintJSON
vim.cmd [[command! -nargs=* -complete=file Rg GrepperRg <args>]]
vim.cmd [[command! PrettyPrintJSON %!python3 -m json.tool]]

vim.g.history = 10000
vim.g.gdefault = true
vim.g.cinoptions = ':0,l1,t0,g0,(0'

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)
