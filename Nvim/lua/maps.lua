local global = vim.g
local opts = { noremap = true }
local keymap = vim.keymap.set

-- Map <leader> = space key
global.mapleader = " "
global.maplocalleader = " "

-- Save
keymap("n", "<leader>w", "<CMD>w<CR>", opts)

-- Quit
keymap("n", "<leader>q", "<CMD>q<CR>", opts)

-- Neotree
keymap("n", "<c-b>", "<CMD>Neotree toggle<CR>", opts)
keymap("n", "<c-o>", "<CMD>Neotree focus<CR>")

-- Switch to next buffer
keymap("n", "<TAB>", "<CMD>bnext<CR>", opts)

-- Close buffer
keymap("n", "<c-c>", "<CMD>bd<CR>", opts)

-- Exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines
keymap("n", "<A-j>", "<CMD>m .+1<CR>", opts) -- Alt is already reserved for GlazeWM
-- keymap("n", "<c-j>", "<CMD>m .+1<CR>", opts)
keymap("n", "<A-k>", "<CMD>m .-2<CR>", opts)
-- keymap("n", "<c-k>", "<CMD>m .-2<CR>", opts)

--Duplicate line
keymap("n", "<A-S-j>", "<CMD>t.<CR>", opts)

-- Terminal
keymap("n", "<leader>ñ", "<CMD>ToggleTerm size=10 direction=horizontal<CR>", opts)

-- Dashboard
keymap("n", "<leader>d", "<CMD>Dashboard<CR>", opts)

-- Colortils
keymap("n", "<C-p>", "<CMD>Colortils<CR>", opts)
