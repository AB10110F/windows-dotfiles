local versionList   = vim.fn.systemlist('nvim --version')
local versionString = table.concat(versionList, "\n")
local version       = versionString:match("NVIM%s+([^%s]+)")

local splash        = require("milli").load({ splash = "shader" })

require("snacks").setup({
  dashboard = {
    enabled = true,
    width = 45,
    preset = {
      header = table.concat(splash.frames[1], "\n"),
      -- header = [[
      --   │ ╲ ││
      --   ││╲╲││
      --   ││ ╲ │ ]],
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        { icon = "󰒋 ", key = "m", desc = "Mason", action = ":Mason" },
        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      }
    },
    sections = {
      { section = "header",        padding = 1 },
      { text = "NVIM " .. version, align = "center", padding = 1 },
      { section = "keys",          gap = 1,          padding = 1 },
      { section = "startup" },
    },
  },
})

require("milli").snacks({ splash = "shader", loop = true })
