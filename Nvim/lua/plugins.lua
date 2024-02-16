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
  'folke/tokyonight.nvim',
  'olivercederborg/poimandres.nvim',
  { "catppuccin/nvim",         name = "catppuccin", priority = 1000 },

  -- Interface
  'nvim-lualine/lualine.nvim',
  'rcarriga/nvim-notify',
  'gelguy/wilder.nvim',
  "sindrets/diffview.nvim",
  "yamatsum/nvim-cursorline",
  "folke/zen-mode.nvim",
  "huy-hng/anyline.nvim",

  { 'akinsho/toggleterm.nvim', version = "*",       config = true },
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl",        opts = {} },
  { 'akinsho/bufferline.nvim', version = "*",       dependencies = 'nvim-tree/nvim-web-devicons' },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins-config..gitsigns")
    end
  },

  -- Navigation
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { 'ghassan0/telescope-glyph.nvim', config = function() require('telescope').load_extension('glyph') end },

  -- Functional

  "allen-mack/nvim-table-md",
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = { markdown = { fat_headline_lower_string = "─", }, },
  },

  "nvim-treesitter/nvim-treesitter",
  "windwp/nvim-ts-autotag",

  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    opts = {},
    lazy = false,
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, { --[[ mode = 'foreground', ]] css = true })
    end,
  },

  {
    'ziontee113/color-picker.nvim',
    config = function()
      require('color-picker').setup()
    end
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {
        disable_in_visualblock = true,
        disable_filetype = { "TelescopePrompt", "vim" },
      }
    end
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(function() vim.cmd('MasonUpdate') end)
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'hrsh7th/cmp-path' }      -- Required
    }
  }

}

local opts = {}

require("lazy").setup(plugins, opts)
