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
  { "akinsho/toggleterm.nvim",             name = "toggleterm",       version = "*",      config = true },
  { "akinsho/bufferline.nvim",             name = "bufferline",       version = "*" },       -- Requires devicons
  { 'nvimdev/dashboard-nvim',              name = "dashboard",        event = "VimEnter", }, -- Requires devicons
  { "lukas-reineke/indent-blankline.nvim", name = "indent-blankline", main = "ibl" },
  { "sphamba/smear-cursor.nvim",           opts = {} },

  {
    "echasnovski/mini.indentscope",
    version = "*",
    opts = { symbol = "│", delay = 0, }
  },

  {
    "nvchad/showkeys",
    config = function()
      vim.cmd('ShowkeysToggle')
    end
  },

  {
    "echasnovski/mini.cursorword",
    version = "*",
    config = function()
      require('mini.cursorword').setup({})
    end,
  },

  {
    "OXY2DEV/helpview.nvim",
    lazy = false, -- Recommended
    opts = {
      title = {
        enable = true,
        style = "decorated",
        parts = {
          "╭", "─", "╮",
          "│", " ", "│",
          "╰", "─", "╯"
        },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },

  -- Navigation
  { "nvim-telescope/telescope.nvim", name = "telescope",                           tag = "0.1.3", }, -- Requires plenary.nvim
  { "2kabhishek/nerdy.nvim",         dependencies = { "stevearc/dressing.nvim", }, cmd = "Nerdy", },
  { "rafi/telescope-thesaurus.nvim" },
  { "hedyhli/outline.nvim",          lazy = true,                                  cmd = { "Outline", "OutlineOpen" }, opts = {}, },


  {
    "EL-MASTOR/bufferlist.nvim",
    lazy = true,
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = "BufferList",
    opts = {},
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },

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

  -- Functional
  { "windwp/nvim-ts-autotag",                      name = "autotag" },
  { "allen-mack/nvim-table-md",                    name = "table-md",        ft = "markdown" },
  { 'MeanderingProgrammer/render-markdown.nvim',   name = "render-markdown", ft = "markdown" },
  { "jbyuki/venn.nvim",                            name = "venn" },
  { "nvim-treesitter/nvim-treesitter",             build = ":TSUpdate",      event = { "BufReadPre", "BufNewFile" } }, -- name = "treesitter",
  { "nvim-treesitter/nvim-treesitter-textobjects", name = "textObjects" },

  {
    "brenoprata10/nvim-highlight-colors",
    name = "highlight-colors",
    opts = {
      render = 'virtual',
      virtual_symbol = '󱓻',
      enable_tailwind = true,
      exclude_filetypes = { "lazy" }
    }
  },

  {
    "numToStr/Comment.nvim",
    name = "comment",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", name = "ts-context-commentstring" },
    opts = {},
    lazy = false,
  },

  {
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

  -- LSP Support
  { "neovim/nvim-lspconfig",             name = "lspconfig" },
  { "williamboman/mason.nvim",           name = "mason" },
  { "williamboman/mason-lspconfig.nvim", name = "mason-lspconfig" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp",                  name = "cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "hrsh7th/cmp-path" },
}

local opts = {
  ui = { border = "rounded", },
  rocks = { enabled = false },
  install = { colorscheme = { "tokyonight-storm" } },
  -- dev = {
  --@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
  -- path = "~/projects",
  -- }
}

require("lazy").setup(plugins, opts)
