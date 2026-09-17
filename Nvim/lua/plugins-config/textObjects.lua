require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V',  -- linewise
    },
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true,
  }
}

vim.keymap.set({ "x", "o" }, "aa", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ia", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "af", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ac", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "al", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "il", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ai", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ii", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "a-", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@comment.outer", "textobjects")
end)

-- move
vim.keymap.set({ "n", "x", "o" }, "ma", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "ma", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "mf", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "mF", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "mc", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "mC", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "ml", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@loop.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "mL", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "mi", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.inner", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "mI", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "m-", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@comment.outer", "textobjects")
end)
