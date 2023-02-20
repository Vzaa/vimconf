vim.g.mapleader = ','
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'tpope/vim-sleuth',
    'honza/vim-snippets',
    'mbbill/undotree',
    'mhinz/vim-grepper',
    'rust-lang/rust.vim',
    'leafo/moonscript-vim',
    'maxbrunsfeld/vim-yankstack',
    'vim-scripts/a.vim',
    'ziglang/zig.vim',
    { "sindrets/diffview.nvim",   dependencies = { "nvim-lua/plenary.nvim" } },
    { 'windwp/nvim-autopairs',    opts = {} },
    { 'kyazdani42/nvim-tree.lua', opts = {} },
    { 'lewis6991/gitsigns.nvim',  opts = {} },
    { "rcarriga/nvim-dap-ui",     dependencies = { "mfussenegger/nvim-dap" } },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'andersevenrud/cmp-tmux'
        },
        opts = {
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer' },
                {
                    name = 'tmux',
                    option = {
                        all_panes = true,
                    }
                }
            },
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = false,
                theme = 'gruvbox',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    },
    -- { import = 'custom.plugins' },
}, {})

require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')

-- Setup mason so it can manage external tooling
require('mason').setup()

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
