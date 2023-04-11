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
  -- "EdenEast/nightfox.nvim",
  -- 'rockerBOO/boo-colorscheme-nvim'

  -- Interface
  'nvim-lualine/lualine.nvim',
  'rcarriga/nvim-notify',
  "lukas-reineke/indent-blankline.nvim",
  {
	'glepnir/dashboard-nvim',
	event = 'VimEnter',
	config = function()
	  require('dashboard').setup {
	  }
	end,
	dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("plugins-config..gitsigns")
	end,
  },

  --[[ {
	"xiyaowong/nvim-transparent",
	config = function()
		require("transparent").setup({
			groups = { -- table: default groups
				'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
				'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
				'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
				'SignColumn', 'CursorLineNr', 'EndOfBuffer',
			},
			extra_groups = {
				"BufferLineTabClose",
				"BufferlineBufferSelected",
				"BufferLineFill",
				"BufferLineBackground",
				"BufferLineSeparator",
				"BufferLineIndicatorSelected",
			},
			exclude_groups = {},
		})
	end,
  }, ]]


  -- Navigation
  'nvim-tree/nvim-web-devicons',
  'nanozuki/tabby.nvim',

  {
    {'akinsho/toggleterm.nvim', version = "*", config = true}
  },
  
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
  
  'shoukoo/commentary.nvim',

  {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({ "*" })
	end,
  },

  {
	"nvim-treesitter/nvim-treesitter",
	run = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		require("plugins-config.treesitter")
	end,
  },

  {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {
    disable_in_visualblock = true,
	disable_filetype = { "TelescopePrompt", "vim" },
    } end
  },



  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason-lspconfig.nvim",
  "glepnir/lspsaga.nvim",
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },

}


  local opts = {}

  require("lazy").setup(plugins, opts)

