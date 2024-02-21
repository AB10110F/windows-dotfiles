local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  --Themes
  { "folke/tokyonight.nvim",           name = "tokyonight", },
  { "olivercederborg/poimandres.nvim", name = "poimandres", },

  -- Interface
  { "nvim-lualine/lualine.nvim",       name = "lualine" },
  { "rcarriga/nvim-notify",            name = "notify" },
  { "gelguy/wilder.nvim",              name = "wilder" },
  { "sindrets/diffview.nvim",          name = "diffview" },
  { "yamatsum/nvim-cursorline",        name = "cursorline" },
  { "folke/zen-mode.nvim",             name = "zen-mode",   event = "VeryLazy" },
  { "akinsho/toggleterm.nvim",         name = "toggleterm", version = "*",      config = true },
  { "akinsho/bufferline.nvim",         name = "bufferline", version = "*" },                      -- Requires devicons
  { "glepnir/dashboard-nvim",          name = "dashboard",  event = "VimEnter", },                -- Requires devicons
  { "huy-hng/anyline.nvim",            name = "anyline",    event = 'VeryLazy', config = true, }, -- Require treesitter
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl",        opts = {} },

  {
    "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    config = function()
      require("plugins-config..gitsigns")
    end,
  },

  -- Navigation
  { "nvim-telescope/telescope.nvim", name = "telescope", tag = "0.1.3", }, -- Requires plenary.nvim

  {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neo-tree",
    branch = "v3.x",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", name = "devicons" },
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },

  {
    "ghassan0/telescope-glyph.nvim",
    name = "telescope-glyph",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("glyph")
    end,
  },

  -- Functional
  { "windwp/nvim-ts-autotag",        name = "autotag" },
  { "allen-mack/nvim-table-md",      name = "table-md",  ft = "markdown" },

  {
    "lukas-reineke/headlines.nvim", -- Requires treesitter
    name = "headlines",
    ft = "markdown",
    opts = { markdown = { fat_headline_lower_string = "─" } },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    -- name = "treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" }
  },

  {
    "numToStr/Comment.nvim",
    name = "comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", name = "ts-context-commentstring" },
    opts = {},
    lazy = false,
  },

  {
    "norcalli/nvim-colorizer.lua",
    name = "colorizer",
    config = function()
      require("colorizer").setup({ "*" }, { --[[ mode = 'foreground', ]]
        css = true,
      })
    end,
  },

  {
    "ziontee113/color-picker.nvim",
    name = "color-picker",
    event = "VeryLazy",
    config = function()
      require("color-picker").setup()
    end,
  },

  {
    "windwp/nvim-autopairs",
    name = "autopairs",
    config = function()
      require("nvim-autopairs").setup({
        disable_in_visualblock = true,
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    name = "lsp-zero",
    branch = "v2.x",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig",             name = "lspconfig" }, -- Required
      {                                                            -- Optional
        "williamboman/mason.nvim",
        name = "mason",
        build = function()
          pcall(function()
            vim.cmd("MasonUpdate")
          end)
        end,
      },
      { "williamboman/mason-lspconfig.nvim", name = "mason-lspconfig" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp",                  name = "cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" },                            -- Required
      { "L3MON4D3/LuaSnip" },                                -- Required
      { "hrsh7th/cmp-path" },                                -- Required
    },
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
