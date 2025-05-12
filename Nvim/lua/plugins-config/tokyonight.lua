require("tokyonight").setup({
  style = "storm",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true,
  terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim

  styles = {
    sidebars = "transparent",
    floats = "transparent",
  },

  on_colors = function(colors)
    -- colors.bg_statusline = colors.none
    colors.bg_statusline = '#16161e'
  end,
})
-- vim.g.tokyonight_transparent = vim.g.transparent_enabled

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "tokyonight,tokyonight-storm",
  callback = function()
    local nvim_hl = vim.api.nvim_set_hl

    nvim_hl(0, 'LineNrAbove', { fg = '#525B82', bold = true })
    nvim_hl(0, 'CursorLineNr', { fg = '#C0CAF5', bg = "#16161e", bold = true })
    nvim_hl(0, 'CursorLineNRActive', { fg = '#C0CAF5', bg = "#16161e", bold = true })
    nvim_hl(0, 'CursorLineNRInactive', { fg = '#C0CAF5', bg = "NONE", bold = true })
    nvim_hl(0, 'LineNrBelow', { fg = '#525B82', bold = true })
    nvim_hl(0, 'LineNr', { fg = '#525B82', bold = true })
    nvim_hl(0, 'FloatBorder', { fg = "#C0CAF5", bg = "NONE" })
    nvim_hl(0, 'CursorLine', { bg = "#16161e" })
    nvim_hl(0, 'Folded', { bg = "#16161e" })

    -- MiniCursorWord
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

    -- Neotree
    nvim_hl(0, 'NeoTreeGitModified', { bg = 'NONE', fg = '#525B82' })
    nvim_hl(0, 'NeoTreeModified', { bg = 'NONE', fg = '#525B82' })
    -- nvim_hl(0, 'NeoTreeWinSeparator', { bg = 'NONE', fg = '#C0CAF5' })

    -- MiniIndentscope
    nvim_hl(0, 'MiniIndentscopeSymbol', { bg = 'NONE', fg = '#A9B1D6' })

    -- Dashboard
    nvim_hl(0, 'DashboardHeader', { bg = 'NONE', fg = '#7AA2F7' })

    -- Showkeys
    nvim_hl(0, 'SkActive', { bg = '#16161e' })
    nvim_hl(0, 'SkInactive', { bg = '#C0CAF5', fg = '#16161e' })

    -- Telescope
    nvim_hl(0, 'TelescopeSelection', { bg = '#16161e' })

    -- Bufferline
    require('bufferline').setup({
      highlights = {
        fill = { bg = '#16161e', },
        background = { bg = '#16161e', },

        buffer_visible = { bg = '#16161e', },
        buffer_selected = { bg = '#16161e', bold = true, italic = false, },

        numbers = { bg = '#16161e', },
        numbers_visible = { bg = '#16161e', },
        numbers_selected = { bg = '#16161e', bold = true, italic = false, },

        modified = { bg = '#16161e', },
        modified_visible = { bg = '#16161e', },
        modified_selected = { bg = '#16161e', },

        duplicate_selected = { bg = '#16161e', italic = true, },
        duplicate_visible = { bg = '#16161e', italic = true, },
        duplicate = { bg = '#16161e', italic = true, },

        separator_selected = { bg = '#16161e', },
        separator_visible = { bg = '#16161e', },
        separator = { bg = '#16161e', },
        offset_separator = { bg = '#16161e' },

        indicator_visible = { fg = '#c0caf5', bg = '#16161e', },
        indicator_selected = { fg = '#c0caf5', bg = '#16161e', },

        trunc_marker = { bg = '#16161e', }
      },
    })

    -- Lualine
    vim.schedule(function()
      nvim_hl(0, 'lualine_a_normal', { bg = '#C0CAF5', fg = '#16161e' })
      nvim_hl(0, "lualine_b_normal", { bg = '#16161e' })
      nvim_hl(0, "lualine_b_diff_added_normal", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diff_modified_normal", { bg = '#16161e', fg = '#C0CAF5' })
      nvim_hl(0, "lualine_b_diff_removed_normal", { bg = '#16161e', fg = '#db4b4b' })
      nvim_hl(0, "lualine_b_diagnostics_info_normal", { bg = '#16161e', fg = '#0db9d7' })
      nvim_hl(0, "lualine_b_diagnostics_hint_normal", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diagnostics_warn_normal", { bg = '#16161e', fg = '#e0af68' })
      nvim_hl(0, "lualine_b_diagnostics_error_normal", { bg = '#16161e', fg = '#db4b4b' })

      nvim_hl(0, "lualine_b_insert", { bg = '#16161e' })
      nvim_hl(0, "lualine_b_diff_added_insert", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diff_modified_insert", { bg = '#16161e', fg = '#C0CAF5' })
      nvim_hl(0, "lualine_b_diff_removed_insert", { bg = '#16161e', fg = '#db4b4b' })
      nvim_hl(0, "lualine_b_diagnostics_info_insert", { bg = '#16161e', fg = '#0db9d7' })
      nvim_hl(0, "lualine_b_diagnostics_hint_insert", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diagnostics_warn_insert", { bg = '#16161e', fg = '#e0af68' })
      nvim_hl(0, "lualine_b_diagnostics_error_insert", { bg = '#16161e', fg = '#db4b4b' })

      nvim_hl(0, "lualine_b_visual", { bg = '#16161e' })
      nvim_hl(0, "lualine_b_diff_added_visual", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diff_modified_visual", { bg = '#16161e', fg = '#C0CAF5' })
      nvim_hl(0, "lualine_b_diff_removed_visual", { bg = '#16161e', fg = '#db4b4b' })
      nvim_hl(0, "lualine_b_diagnostics_info_visual", { bg = '#16161e', fg = '#0db9d7' })
      nvim_hl(0, "lualine_b_diagnostics_hint_visual", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diagnostics_warn_visual", { bg = '#16161e', fg = '#e0af68' })
      nvim_hl(0, "lualine_b_diagnostics_error_visual", { bg = '#16161e', fg = '#db4b4b' })

      nvim_hl(0, "lualine_b_command", { bg = '#16161e' })
      nvim_hl(0, "lualine_b_diff_added_command", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diff_modified_command", { bg = '#16161e', fg = '#C0CAF5' })
      nvim_hl(0, "lualine_b_diff_removed_command", { bg = '#16161e', fg = '#db4b4b' })
      nvim_hl(0, "lualine_b_diagnostics_info_command", { bg = '#16161e', fg = '#0db9d7' })
      nvim_hl(0, "lualine_b_diagnostics_hint_command", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diagnostics_warn_command", { bg = '#16161e', fg = '#e0af68' })
      nvim_hl(0, "lualine_b_diagnostics_error_command", { bg = '#16161e', fg = '#db4b4b' })

      nvim_hl(0, "lualine_b_terminal", { bg = '#16161e' })
      nvim_hl(0, "lualine_b_diff_added_terminal", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diff_modified_terminal", { bg = '#16161e', fg = '#C0CAF5' })
      nvim_hl(0, "lualine_b_diff_removed_terminal", { bg = '#16161e', fg = '#db4b4b' })
      nvim_hl(0, "lualine_b_diagnostics_info_terminal", { bg = '#16161e', fg = '#0db9d7' })
      nvim_hl(0, "lualine_b_diagnostics_hint_terminal", { bg = '#16161e', fg = '#1abc9c' })
      nvim_hl(0, "lualine_b_diagnostics_warn_terminal", { bg = '#16161e', fg = '#e0af68' })
      nvim_hl(0, "lualine_b_diagnostics_error_terminal", { bg = '#16161e', fg = '#db4b4b' })
    end)
  end,
})

vim.cmd [[colorscheme tokyonight]]
