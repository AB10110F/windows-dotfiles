require 'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",

        ["a/"] = "@comment.outer",
        ["a-"] = "@comment.outer",
      },

      include_surrounding_whitespace = false,
    },
    move = {
      enable = true,
      set_jumps = false,
      goto_next_start = {
        ["ma"] = "@parameter.inner",
        ["mf"] = "@function.outer",
        ["mc"] = "@class.outer",
        ["ml"] = "@loop.outer",
        ["mi"] = "@conditional.outer",

        ["m/"] = "@comment.outer",
        ["m-"] = "@comment.outer",
      },
      goto_previous_start = {
        ["ma"] = "@parameter.outer",
        ["mF"] = "@function.outer",
        ["mC"] = "@class.outer",
        ["mL"] = "@loop.outer",
        ["mC"] = "@conditional.outer",

        ["m/"] = "@comment.outer",
        ["m-"] = "@comment.outer",
      },
    },
  },
}
