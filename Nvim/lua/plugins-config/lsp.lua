local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

require('lspconfig.ui.windows').default_options.border = 'rounded'

-- Border
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded", })
vim.lsp.buf.hover({ border = "rounded", })

-- Disable inline diagnostic
vim.diagnostic.config({ virtual_text = false, })

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 100
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { border = "rounded", focus = false })
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

-- lsp's settings
lspconfig.lua_ls.setup {
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

lspconfig.clangd.setup { capabilities = capabilities }
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.tsserver.setup { capabilities = capabilities }
lspconfig.jdtls.setup { capabilities = capabilities }
lspconfig.rust_analyzer.setup { capabilities = capabilities }

lspconfig.texlab.setup {
  capabilities = capabilities,
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
