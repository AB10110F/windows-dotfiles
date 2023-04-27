local global = vim.g

vim.keymap.set("n", "<c-b>", "<CMD>Neotree toggle<CR>")
vim.keymap.set("n", "<c-o>", "<CMD>Neotree focus<CR>")


-- Map <leader> = space key

global.mapleader = " "
global.maplocalleader = " "

-- Save
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>")

-- Quit
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>")

-- Split panel
vim.keymap.set("n", "s", "<CMD>vsplit<CR>")

-- Switch to next buffer
vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>")

-- Close buffer
vim.keymap.set("n", "<c-c>", "<CMD>bd<CR>")

-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- Terminal
vim.keymap.set("n", "<leader>ñ", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")

-- Dashboard
vim.keymap.set("n", "<leader>d", "<CMD>Dashboard<CR>")
