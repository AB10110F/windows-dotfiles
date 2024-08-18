require("tokyonight").setup({
  style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  -- light_style = "day", -- The theme is used when the background is set to light
  transparent = true,     -- Enable this to disable setting the background color
  -- dark_sidebar = false,
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    -- comments = { italic = true },
    -- keywords = { italic = true },
    -- functions = {},
    -- variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent",
    floats = "transparent",
  },

  on_colors = function(colors)
    colors.bg_statusline = colors.none -- or "NONE"
    -- colors.bg_winbar = colors.none
    -- colors.bg_tabline = colors.none
    -- colors.bg_inactive_winbar = colors.none
  end,
  -- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  -- hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  -- dim_inactive = false, -- dims inactive windows
  -- lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
})
-- vim.g.tokyonight_transparent = vim.g.transparent_enabled
vim.cmd [[colorscheme tokyonight]]
vim.api.nvim_set_hl(0, 'MiniCursorWord', { underline = true })
vim.api.nvim_set_hl(0, 'MiniCursorWordCurrent', { underline = true })
