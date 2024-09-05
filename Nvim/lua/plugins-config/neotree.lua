vim.g.loaded_newtrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup({
  popup_border_style = "rounded",
  enable_git_status = true,
  window = {
    width = 30,
  },
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
    modified = {
      symbol = "",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖", -- this can only be used in the git_status source
        renamed   = "󰁕", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      }
    },
  },

  filesystem = {
    window = {
      mappings = {
        ["<C-b>"] = "noop" -- disable default mapping
      }
    }
  },

  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd("highlight! Cursor blend=100")
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
      end,
    },
    {
      event = "neo_tree_popup_input_ready",
      handler = function()
        vim.cmd("stopinsert")
        vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
      end,
    },
  }
})
