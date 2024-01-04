vim.g.loaded_newtrw = 1
vim.g.loaded_netrwPlugin = 1
require("neo-tree").setup({

  window = {
          -- position = "left",
          width = 30,
          -- auto_expand_width = false,
  },
  enable_normal_mode_for_inputs = true,
})

-- vim.fn.sign_define("DiagnosticSignError",
--         {text = " ", texthl = "DiagnosticSignError"})
--       vim.fn.sign_define("DiagnosticSignWarn",
--         {text = " ", texthl = "DiagnosticSignWarn"})
--       vim.fn.sign_define("DiagnosticSignInfo",
--         {text = " ", texthl = "DiagnosticSignInfo"})
--       vim.fn.sign_define("DiagnosticSignHint",
--         {text = "󰌵", texthl = "DiagnosticSignHint"})
