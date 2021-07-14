-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  use 'itchyny/lightline.vim' -- Fancier statusline
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-compe' -- Autocompletion plugin

  use 'windwp/nvim-autopairs'
  use 'mbbill/undotree'
  use 'mhinz/vim-grepper'
  use 'rust-lang/rust.vim'
  use 'leafo/moonscript-vim'
  use 'maxbrunsfeld/vim-yankstack'
  use 'vim-scripts/a.vim'
  use 'wellle/tmux-complete.vim'
  use 'kyazdani42/nvim-tree.lua'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'morhetz/gruvbox'
end)

require('gitsigns').setup()
require('nvim-autopairs').setup()

require('settings')
require('comp')
require('lsp')
require('treesitter')
require('keymaps')
