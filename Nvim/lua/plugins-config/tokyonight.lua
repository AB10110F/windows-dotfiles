require("tokyonight").setup({
  style = "storm",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true,
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

local nvim_hl = vim.api.nvim_set_hl

nvim_hl(0, 'LineNrAbove', { fg = '#525B82', bold = true })
nvim_hl(0, 'CursorLineNr', { fg = '#C0CAF5', bold = true })
nvim_hl(0, 'LineNrBelow', { fg = '#525B82', bold = true })
nvim_hl(0, "FloatBorder", { fg = "#C0CAF5", bg = "NONE" })

nvim_hl(0, 'MiniCursorWord', { underline = true })
nvim_hl(0, 'MiniCursorWordCurrent', { underline = true })

-- cmp
nvim_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#E0AF68' })

nvim_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#2AC3DE' })
nvim_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })

nvim_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#7AA2F7' })
nvim_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
nvim_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })

nvim_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#9D7CD8' })
nvim_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })

nvim_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#C0CAF5' })
nvim_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
nvim_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
