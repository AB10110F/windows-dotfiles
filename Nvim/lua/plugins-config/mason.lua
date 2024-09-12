require("mason").setup({
  ui = {
    border = "rounded",
    height = 0.8,
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "cssls",
    "clangd",
    "ts_ls",
    "jdtls",
    "rust_analyzer",
    "texlab",
  },
  automatic_installation = true,
})
