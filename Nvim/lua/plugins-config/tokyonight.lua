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

-- cmp
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#E0AF68' })

vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#2AC3DE' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })

vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#7AA2F7' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })

vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#9D7CD8' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })

vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#C0CAF5' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
