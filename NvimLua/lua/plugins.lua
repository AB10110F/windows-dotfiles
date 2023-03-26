local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Plugins List:
  
  --Themes
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"

  -- Interface
  use 'nvim-lualine/lualine.nvim'
  use ({'glepnir/dashboard-nvim', requires = 'nvim-tree/nvim-web-devicons'})

  use({
	"lewis6991/gitsigns.nvim",
	config = function()
		require("plugins-config..gitsigns")
	end,
	})

  use({
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
	})


  -- Navigation
  use 'nvim-tree/nvim-web-devicons'
  use 'nanozuki/tabby.nvim'
  use({
  		"nvim-telescope/telescope.nvim",
  		tag = "0.1.1",
  		requires = { { "nvim-lua/plenary.nvim" } },
  	})
  use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("plugins-config.toggleterm")
		end,
	})
  use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})  

  -- Functional

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
	}

  use({
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({ "*" })
	end,
  	})

  use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugins-config.treesitter")
		end,
	})

  use({
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {
      	disable_in_visualblock = true,
	  	disable_filetype = { "TelescopePrompt", "vim" },
    	} end
	
	})

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
