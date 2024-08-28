require("mason").setup({
  ui = {
    border = "rounded",
    height = 0.8,
  }
})
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "cssls",
    "clangd",
    "tsserver",
    "jdtls",
    "rust_analyzer",
    "texlab" },
  automatic_installation = true,
})

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {}
lspconfig.clangd.setup {}
lspconfig.cssls.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}

lspconfig.texlab.setup {
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        executable = "tectonic",
        args = {
          "-X",
          "compile",
          "%f",
          "--synctex",
          "--keep-logs",
          "--keep-intermediates"
        },
        forwardSearchAfter = true,
        onSave = false
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        executable = "C:\\Users\\WSwor\\scoop\\apps\\sioyek\\2.0.0\\sioyek",
        args = {
          "--reuse-window",
          "--execute-command",
          "toggle_synctex",
          "--inverse-search",
          "texlab inverse-search -i \"%%1\" -l %%2",
          "--forward-search-file",
          "%f",
          "--forward-search-line",
          "%l",
          "%p",
        }
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false
      }
    }
  }
}
