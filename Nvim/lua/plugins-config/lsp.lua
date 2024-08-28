local lsp = require('lsp-zero').preset('recommended')

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_action = require('lsp-zero').cmp_action()
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

require('nvim-autopairs').setup({
  enable_check_bracket_line = true
})

cmp.setup({

  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = {
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),

    ['<Enter>'] = cmp.mapping.confirm({ select = false }),
    ['<C-x>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.scroll_docs(-4),
    ['<Down>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    -- ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
  },

  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },

  experimental = {
    ghost_text = { hlgroup = "Comment" }
  },
})

-- Disable inline diagnostic
vim.diagnostic.config({
  virtual_text = false,
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

-- Highlight number and show character
local char = { "E", "W", "I", "H" }

for i, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
  vim.fn.sign_define("DiagnosticSign" .. diag, {
    text = char[i],
    texthl = "DiagnosticSign" .. diag,
    linehl = "",
    numhl = "DiagnosticSign" .. diag,
  })
end
