-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

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
vim.o.timeoutlen = 300
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true

--Save undo history
vim.o.undofile = true
vim.o.backup = true
vim.cmd [[set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp]]
vim.cmd [[set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp]]
vim.cmd [[set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp]]

-- do not wrap searches at the end of the files
vim.o.wrapscan = false
-- start scrolling at 3rd row
vim.o.scrolloff = 3
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Y dis not work
vim.cmd [[highlight Highlighted ctermfg=231 ctermbg=24 cterm=NONE]]
vim.cmd [[highlight! link CursorLineNr Highlighted]]
-- Rg/PrettyPrintJSON
vim.cmd [[command! -nargs=* -complete=file Rg GrepperRg <args>]]
vim.api.nvim_create_user_command("PrettyPrintJSON", "%!python3 -m json.tool", {})

vim.o.history = 10000
vim.o.gdefault = true
vim.o.cinoptions = ':0,l1,t0,g0,(0'
vim.o.laststatus = 3

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
