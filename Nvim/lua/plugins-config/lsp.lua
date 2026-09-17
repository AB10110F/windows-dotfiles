local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
  float = {
    border = "rounded"
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN]  = "W",
      [vim.diagnostic.severity.INFO]  = "I",
      [vim.diagnostic.severity.HINT]  = "H",
    }
  }
})

-- docs Border
local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return hover({
    border = 'rounded',
  })
end

-- lsp's settings
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

vim.lsp.config("tinymist", {
  capabilities = capabilities,
  cmd = { 'tinymist' },
  filetypes = { 'typst' },
  settings = {
    formatterMode = "typstyle",
    formatterIndentSize = 4,
    -- exportPdf command not working
    -- exportPdf = "onSave",
  }
})

-- Temporal fix for exportPdf
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = "*.typ",
--   callback = function()
--     local filepath = vim.api.nvim_buf_get_name(0)
--     local checkSioyek = vim.fn.system({ "tasklist", "/FI", "IMAGENAME eq sioyek.exe", })
--
--     vim.system({ "typst", "compile", filepath })
--     if not checkSioyek:match("sioyek.exe") then
--       local pdf_path = filepath:gsub("%.typ$", ".pdf")
--       vim.system({ "cmd", "/c", "start", "", pdf_path })
--     end
--   end
-- })

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("cssls")
-- vim.lsp.enable("tailwindcss")
vim.lsp.enable("ts_ls")
vim.lsp.enable("jdtls")
vim.lsp.enable("omnisharp")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("tinymist")
vim.lsp.enable("angularls")
