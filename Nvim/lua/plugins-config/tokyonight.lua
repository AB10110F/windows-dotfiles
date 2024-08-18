require("tokyonight").setup({
  style = "storm",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true,      -- Enable this to disable setting the background color
  terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim

  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },

  on_colors = function(colors)
    colors.bg_statusline = colors.none -- or "NONE"
    -- colors.bg_winbar = colors.none
    -- colors.bg_tabline = colors.none
    -- colors.bg_inactive_winbar = colors.none
  end,
})
-- vim.g.tokyonight_transparent = vim.g.transparent_enabled
vim.cmd [[colorscheme tokyonight]]

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#525B82', bold = true })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#C0CAF5', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#525B82', bold = true })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#C0CAF5", bg = "NONE" })
vim.api.nvim_set_hl(0, 'MiniCursorWord', { underline = true })
vim.api.nvim_set_hl(0, 'MiniCursorWordCurrent', { underline = true })
