local lsp = require('lsp-zero').preset('recommended')

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({

  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },

  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),

    ['<Enter>'] = cmp.mapping.confirm({select = true}),
    ['<C-x>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.scroll_docs(-4),
    ['<Down>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    -- ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
  },
})
