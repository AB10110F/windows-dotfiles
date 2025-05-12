local versionList = vim.fn.systemlist('nvim --version')
local versionString = table.concat(versionList, "\n")
local version = versionString:match("NVIM%s+([^%s]+)")

local lazy = require('lazy')
local installed_plugins = lazy.plugins()
local num_lazy_plugins = vim.tbl_count(installed_plugins)
local plugins = (num_lazy_plugins .. " plugins installed")

require('dashboard').setup({
  theme = 'doom',
  config = {
    header = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      "",
      version,
      "",
      "",
    },
    center = {
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Find File                  ',
        key = '1',
        key_hl = 'group',
        action = 'Telescope find_files find_command=rg,--hidden,--files'
      },
      {
        icon = '󰒲  ',
        icon_hl = 'Title',
        desc = 'Lazy',
        key = '2',
        key_hl = 'group',
        action = 'Lazy'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Colorscheme',
        key = '3',
        key_hl = 'group',
        action = 'Telescope colorscheme'
      },
      {
        icon = '󰒋  ',
        icon_hl = 'Title',
        desc = 'Mason',
        key = '4',
        key_hl = 'group',
        action = 'Mason'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Check Health',
        key = '5',
        key_hl = 'group',
        action = 'checkhealth'
      },
    },
    footer = { "", plugins },
    vertical_center = true,
  }
})
