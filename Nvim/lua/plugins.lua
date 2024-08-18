local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  --Themes
  { "folke/tokyonight.nvim",               name = "tokyonight" },

  -- Interface
  { "nvim-lualine/lualine.nvim",           name = "lualine" },
  { "rcarriga/nvim-notify",                name = "notify" },
  { "gelguy/wilder.nvim",                  name = "wilder" },
  { "lewis6991/gitsigns.nvim",             name = "gitsigns" },
  { "sindrets/diffview.nvim",              name = "diffview" },
  { "folke/zen-mode.nvim",                 name = "zen-mode",         event = "VeryLazy" },
  { "akinsho/toggleterm.nvim",             name = "toggleterm",       version = "*",      config = true },
  { "akinsho/bufferline.nvim",             name = "bufferline",       version = "*" },       -- Requires devicons
  { 'nvimdev/dashboard-nvim',              name = "dashboard",        event = "VimEnter", }, -- Requires devicons
  { "lukas-reineke/indent-blankline.nvim", name = "indent-blankline", main = "ibl" },

  {
    "echasnovski/mini.cursorword",
    version = "*",
    config = function()
      require('mini.cursorword').setup({})
    end,
  },

  -- Navigation
  { "nvim-telescope/telescope.nvim",             name = "telescope",        tag = "0.1.3", }, -- Requires plenary.nvim

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
  { "windwp/nvim-ts-autotag",                    name = "autotag" },
  { "allen-mack/nvim-table-md",                  name = "table-md",         ft = "markdown" },
  { 'MeanderingProgrammer/render-markdown.nvim', name = "render-markdown",  ft = "markdown" },
  { "jbyuki/venn.nvim",                          name = "venn" },
  -- { "jbyuki/nabla.nvim",                         ft = "markdown" },
  { "brenoprata10/nvim-highlight-colors",        name = "highlight-colors", opts = { render = 'virtual' } },
  { "nvim-treesitter/nvim-treesitter",           build = ":TSUpdate",       event = { "BufReadPre", "BufNewFile" } }, -- name = "treesitter",

  {
    "richardbizik/nvim-toc",
    name = "TOC",
    ft = "markdown",
    config = function()
      require("nvim-toc").setup({
        toc_header = "Table of Contents"
      })
    end,
  },

  {
    "numToStr/Comment.nvim",
    name = "comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", name = "ts-context-commentstring" },
    opts = {},
    lazy = false,
  },

  {
    "ziontee113/color-picker.nvim",
    name = "color-picker",
    event = "VeryLazy",
    config = function()
      require("color-picker").setup({
        options = {
          symbol = "│"
        }
      })
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

local opts = {
  ui = {
    border = "rounded",
  },
  -- dev = {
  --@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
  -- path = "~/projects",
  -- }
}

require("lazy").setup(plugins, opts)
