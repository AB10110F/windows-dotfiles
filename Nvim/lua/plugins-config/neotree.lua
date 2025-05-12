vim.g.loaded_newtrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup({
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = false,
  window = {
    width = 30,
  },
  default_component_configs = {
    container = {
      enable_character_fade = false
    },
    indent = {
      indent_size = 2,
      padding = 0,
      last_indent_marker = "╰",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
    modified = {
      symbol = "",
    },
    name = {
      use_git_status_colors = false,
    },
    git_status = {
      highlight = "Conceal",
      symbols = {
        -- Change type
        added     = "A", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "D", -- this can only be used in the git_status source
        renamed   = "R", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "C",
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
      event = "neo_tree_popup_input_ready",
      handler = function()
        vim.cmd("stopinsert")
        vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
      end,
    },
  }
})
