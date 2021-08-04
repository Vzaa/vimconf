local kmap = vim.api.nvim_set_keymap

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Compe setup
require('compe').setup {
  source = {
    path = true,
    nvim_lsp = true,
    luasnip = false,
    buffer = false,
    calc = false,
    nvim_lua = false,
    vsnip = false,
    ultisnips = true,
    tmux = true,
  },
}

-- Utility functions for compe and luasnip
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
-- local luasnip = require 'luasnip'

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
    return t "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
    return t "<C-R>=UltiSnips#JumpBackwards()<CR>"
  else
    return t '<S-Tab>'
  end
end
-- Map tab to the above tab complete functiones
kmap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
kmap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
kmap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
kmap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })

-- Map compe confirm and complete functions
kmap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
kmap('i', '<c-space>', 'compe#complete()', { expr = true })

vim.cmd [[let g:UltiSnipsExpandTrigger="<c-a>"]]
