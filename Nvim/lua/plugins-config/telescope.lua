local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["s"] = actions.select_vertical,
        ["S"] = actions.select_horizontal
      },
    },
  }
}
