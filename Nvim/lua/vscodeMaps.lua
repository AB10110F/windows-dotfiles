local global = vim.g
local opts = { noremap = true }
local keymap = vim.keymap.set
-- local keymap = vim.api.nvim_set_keymap

-- Map <leader> = space key
global.mapleader = " "
global.maplocalleader = " "

-- Save
keymap("n", "<leader>w", "<CMD>call VSCodeCall('workbench.action.files.save')<CR>", opts)

-- Quit
keymap("n", "<leader>q", "<CMD>call VSCodeCall('workbench.action.closeWindow')<CR>", opts)

-- Find
keymap("n", "<leader>f", "<CMD>call VSCodeCall('actions.find')<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
