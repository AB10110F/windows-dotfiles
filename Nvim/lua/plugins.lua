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
  { "catppuccin/nvim", name = "catppuccin" },

  -- Interface
  'nvim-lualine/lualine.nvim',
  'rcarriga/nvim-notify',
  { 'eandrju/cellular-automaton.nvim', lazy = true, },

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        buftype_exclude = { "terminal","nofile" },
        filetype_exclude = { "dashboard","mason" },
      } end,
  },

  {
	  'glepnir/dashboard-nvim',
	  event = 'VimEnter',
	  config = function()
	    require('dashboard').setup {}
	  end,
	  dependencies = { {'nvim-tree/nvim-web-devicons'}},
  },

  {
	  "lewis6991/gitsigns.nvim",
	  config = function()
		  require("plugins-config..gitsigns")
	  end,
    lazy = true,
  },

  -- Navigation
  {'akinsho/toggleterm.nvim', version = "*", config = true, lazy = true},

  {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {{
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}},
  },

  {
  	'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- Functional

  { 'shoukoo/commentary.nvim', lazy = true, },

  {
	  "norcalli/nvim-colorizer.lua",
	  config = function()
		  require("colorizer").setup({ "*" } ,{mode = 'foreground'})
	  end,
    lazy = true,
  },

  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
    lazy = true,
  },

  "nvim-treesitter/nvim-treesitter",

  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {
      disable_in_visualblock = true,
	    disable_filetype = { "TelescopePrompt", "vim" },
    } end
  },


  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
         build = function()
         pcall(vim.cmd, 'MasonUpdate')
      end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-path'}      -- Required
    }
  }

}

local opts = {}

require("lazy").setup(plugins, opts)
