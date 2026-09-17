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
    -- "tailwindcss",
    "clangd",
    "ts_ls",
    "jdtls",
    "omnisharp",
    "rust_analyzer",
    "texlab",
    "tinymist",
    "angularls",
  },
  automatic_installation = true,
})
