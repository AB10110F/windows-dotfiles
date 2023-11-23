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

-- NvimTree
keymap("n", "<c-b>", "<CMD>NvimTreeToggle<CR>", opts)

-- Switch to next buffer
keymap("n", "<TAB>", "<CMD>bnext<CR>", opts)

-- Close buffer
keymap("n", "<c-c>", "<CMD>bd<CR>", opts)

-- Exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Surrounds
keymap("v", "s(", "xi()<Esc>P")
keymap("v", "s)", "xi()<Esc>P")
keymap("v", "s{", "xi{}<Esc>P")
keymap("v", "s}", "xi{}<Esc>P")
keymap("v", "s[", "xi[]<Esc>P")
keymap("v", "s]", "xi[]<Esc>P")
keymap("v", "s\"", "xi\"\"<Esc>P")
keymap("v", "s\'", "xi\'\'<Esc>P")

-- Select All
keymap('n', "<c-a>", "ggVG")

-- Enter visual block
keymap('n', "vb", "<c-v>") -- Alt reserved for GWM

-- Toggle centered line
keymap('n', '<Leader>zz', ':let &scrolloff=999-&scrolloff<CR>')

-- Move lines
keymap("n", "<A-j>", "<CMD>m .+1<CR>", opts) -- Alt is already reserved for GlazeWM
-- keymap("n", "<c-j>", "<CMD>m .+1<CR>", opts)
keymap("n", "<A-k>", "<CMD>m .-2<CR>", opts)
-- keymap("n", "<c-k>", "<CMD>m .-2<CR>", opts)

--Duplicate line
keymap("n", "<A-S-j>", "<CMD>t.<CR>", opts)

-- Dashboard
keymap("n", "<leader>d", "<CMD>Dashboard<CR>", opts)

-- Colortils
keymap("n", "<C-ñ>", "<CMD>Colortils<CR>", opts)

-- Zen mode
keymap("n", "<leader>z", "<CMD>ZenMode<CR>", opts)

-- Easy split navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
