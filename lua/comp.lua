-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'buffer' },
    {
      name = 'tmux',
      option = {
        all_panes = true,
      }
    }
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<C-Space>'] = cmp.mapping.complete(),
  },
}

vim.cmd [[let g:UltiSnipsExpandTrigger="<c-a>"]]
