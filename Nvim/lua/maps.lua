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

-- Switch to next buffer
vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>")

-- Close buffer
vim.keymap.set("n", "<c-c>", "<CMD>bd<CR>")

-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- Move lines
vim.keymap.set("n", "<A-j>", "<CMD>m .+1<CR>")
vim.keymap.set("n", "<A-k>", "<CMD>m .-2<CR>")

--Duplicate line
vim.keymap.set("n", "<A-S-j>", "<CMD>t.<CR>")


-- Terminal
vim.keymap.set("n", "<leader>ñ", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")

-- Dashboard
vim.keymap.set("n", "<leader>d", "<CMD>Dashboard<CR>")

-- Colortils
vim.keymap.set("n", "<C-p>", "<CMD>Colortils<CR>")
