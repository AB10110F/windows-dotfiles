vim.g.loaded_newtrw = 1
vim.g.loaded_netrwPlugin = 1
require("neo-tree").setup({

  window = {
          -- position = "left",
          width = 30,
          auto_expand_width = false,
  },
  enable_normal_mode_for_inputs = true,
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "󰁕",-- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      }
    },
  }
})
