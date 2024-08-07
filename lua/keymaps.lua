local kmap = vim.api.nvim_set_keymap
local kopt = { noremap = true, silent = true }

-- kmap('', ',', '<Nop>', { noremap = true, silent = true })
-- vim.g.mapleader = ','
-- vim.g.maplocalleader = ','

kmap('n', 'Y', 'yy', kopt)
--Remap for dealing with word wrap
kmap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
kmap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

kmap('n', '^', '0', kopt)
kmap('n', '0', '^', kopt)
-- kmap('n', '<c-h>', '<c-w>h', kopt)
-- kmap('n', '<c-j>', '<c-w>j', kopt)
-- kmap('n', '<c-k>', '<c-w>k', kopt)
-- kmap('n', '<c-l>', '<c-w>l', kopt)
kmap('', '<leader>y', '"+y', kopt)
kmap('', '<leader>p', '"+p', kopt)
kmap('n', '<bs>', '{', kopt)
kmap('o', '<bs>', '{', kopt)
kmap('v', '<bs>', '{', kopt)
kmap('n', '[[', '[[zz', kopt)
kmap('n', ']]', ']]zz', kopt)
kmap('n', '{', '{zz', kopt)
kmap('n', '}', '}zz', kopt)
kmap('n', 'n', [[(v:searchforward ? 'nzz' : 'Nzz')]], { expr = true, silent = true, noremap = true })
kmap('n', 'N', [[(v:searchforward ? 'Nzz' : 'nzz')]], { expr = true, silent = true, noremap = true })

kmap('o', '<CR>', [[empty(&buftype) ? '}' : '<CR>']], { expr = true, silent = true, noremap = true })
kmap('n', '<CR>', [[empty(&buftype) ? '}' : '<CR>']], { expr = true, silent = true, noremap = true })
kmap('v', '<CR>', '}', kopt)

kmap('c', '<c-n>', '<down>', { noremap = true })
kmap('c', '<c-p>', '<up>', { noremap = true })

kmap('n', '<F6>', ':NvimTreeToggle<cr>', kopt)
kmap('n', '<F7>', ':UndotreeToggle<cr>', kopt)

kmap('n', '<space>', '<C-^>', kopt)


-- kmap('n', '<c-up>', 'ddP', kopt)
-- kmap('n', '<c-down>', 'ddp', kopt)

-- telescope
kmap('n', '<c-p>', '<cmd>Telescope find_files<cr>', kopt)
kmap('n', '<leader>b', '<cmd>Telescope buffers<cr>', kopt)
kmap('n', '<leader>x', '<cmd>Telescope command_history<cr>', kopt)
kmap('n', '<leader>W', '<cmd>Telescope grep_string<cr>', kopt)
kmap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], kopt)
kmap('n', '<leader><space>', ':noh<cr>', kopt)
kmap('n', '<leader>w', '<cmd>nohlsearch<CR>', kopt)

-- kmap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', kopt)
-- kmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', kopt)
-- kmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', kopt)
kmap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', kopt)

kmap('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
kmap('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

vim.keymap.set('n', '<leader>l', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set("n", "<leader>g", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
