-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  -- UI to select things (files, grep results, open buffers...)
  use {
      'nvim-telescope/telescope.nvim', branch = '0.1.x',
      requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }

  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      run = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
      end,
  }
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'williamboman/mason.nvim' -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim' -- Automatically install language servers to stdpath

  -- nvim-cmp stuff
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-buffer'
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
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
        }
      end
  }

  if is_bootstrap then
    require('packer').sync()
  end
end)

require('gitsigns').setup()
require('nvim-autopairs').setup()
require('nvim-tree').setup()
require('telescope').setup {
    defaults = {
        layout_strategy = 'vertical',
        layout_config = { height = 0.95 },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
    }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension("ui-select")

-- Setup mason so it can manage external tooling
require('mason').setup()

require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
    },
}
require('settings')
require('lsp')
require('comp')
require('treesitter')
require('keymaps')

local dap = require('dap')

dap.adapters.codelldb = {
    type = 'server',
    port = '13000',
    executable = {
        command = 'codelldb',
        args = { '--port', '13000' },
    },
}

dap.configurations.c = {
    {
        type = "codelldb",
        request = "launch",
        cwd = '${workspaceFolder}',
        terminal = 'integrated',
        console = 'integratedTerminal',
        stopOnEntry = false,
        program = function()
          -- want it in cmdline, without callback. so fn.input better than ui.input
          return vim.fn.input('executable: ', vim.loop.cwd() .. '/', 'file')
        end
    }
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.cpp
dap.configurations.zig = dap.configurations.cpp

require("dapui").setup()
