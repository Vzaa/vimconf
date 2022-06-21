-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'nvim-telescope/telescope-ui-select.nvim' }

  use 'itchyny/lightline.vim' -- Fancier statusline
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {'nvim-treesitter/nvim-treesitter', branch = "master" }
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client

  -- nvim-cmp stuff
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use 'andersevenrud/cmp-tmux'

  use 'windwp/nvim-autopairs'
  use 'mbbill/undotree'
  use 'mhinz/vim-grepper'
  use 'rust-lang/rust.vim'
  use 'leafo/moonscript-vim'
  use 'maxbrunsfeld/vim-yankstack'
  use 'vim-scripts/a.vim'
  use 'kyazdani42/nvim-tree.lua'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'morhetz/gruvbox'
  use 'tpope/vim-sleuth'
  use 'ziglang/zig.vim'
end)

require('gitsigns').setup()
require('nvim-autopairs').setup()
require('nvim-tree').setup()
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")

require('settings')
require('lsp')
require('comp')
require('treesitter')
require('keymaps')
