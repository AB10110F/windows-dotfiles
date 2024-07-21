local global = vim.g
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Map <leader> = space key
global.mapleader = " "
global.maplocalleader = " "

-- Save
keymap("n", "<leader>w", "<CMD>w<CR>", opts)

-- Quit
keymap("n", "<leader>q", "<CMD>q<CR>", opts)

-- Exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Surrounds
keymap("v", "s(", "xi()<ESC>P")
keymap("v", "s)", "xi()<ESC>P")
keymap("v", "s{", "xi{}<ESC>P")
keymap("v", "s}", "xi{}<ESC>P")
keymap("v", "s[", "xi[]<ESC>P")
keymap("v", "s]", "xi[]<ESC>P")
keymap("v", "s\"", "xi\"\"<ESC>P")
keymap("v", "s\'", "xi\'\'<ESC>P")

-- Enter visual block
keymap('n', "vb", "<C-v>") -- Ctrl reserved for paste

-- Show diagnostic
keymap('n', "<leader>t", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)

-- Toggle centered line
keymap('n', '<Leader>zz', ':let &scrolloff=999-&scrolloff<CR>')

-- Toggle wrap
keymap('n', '<Leader>-', ':set wrap!<CR>')

-- Easy split navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")

-- Buffers navigation
keymap("n", "<TAB>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-TAB>", "<Cmd>bprevious<CR>", opts)
keymap("n", "<C-c>", "<CMD>bd<CR>", opts)          -- Close buffer
keymap("n", "<leader>cc", "<CMD>%bd|e#<CR>", opts) -- Close all buffers except current


-- Plugins

-- Dashboard
keymap("n", "<leader>d", "<CMD>Dashboard<CR>", opts)

-- NvimTree
keymap("n", "<c-b>", "<CMD>Neotree toggle<CR>", opts)

-- Bufferline
keymap('n', '<leader>1', '<CMD>BufferLineGoToBuffer 1<CR>', opts)
keymap('n', '<leader>2', '<CMD>BufferLineGoToBuffer 2<CR>', opts)
keymap('n', '<leader>3', '<CMD>BufferLineGoToBuffer 3<CR>', opts)
keymap('n', '<leader>4', '<CMD>BufferLineGoToBuffer 4<CR>', opts)
keymap('n', '<leader>5', '<CMD>BufferLineGoToBuffer 5<CR>', opts)
keymap('n', '<leader>6', '<CMD>BufferLineGoToBuffer 6<CR>', opts)
keymap('n', '<leader>7', '<CMD>BufferLineGoToBuffer 7<CR>', opts)
keymap('n', '<leader>8', '<CMD>BufferLineGoToBuffer 8<CR>', opts)
keymap('n', '<leader>9', '<CMD>BufferLineGoToBuffer 9<CR>', opts)
keymap('n', '<leader>0', '<CMD>BufferLineGoToBuffer -1<CR>', opts)

-- PickColor
keymap("n", "<C-p>", "<CMD>PickColor<CR>", opts)
keymap("i", "<C-p>", "<CMD>PickColorInsert<CR>", opts)

-- Telescope
local builtin = require('telescope.builtin')

keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<leader>fc', builtin.colorscheme, {})
keymap('n', '<leader>fo', builtin.oldfiles, {})
keymap('n', '<leader>fk', builtin.keymaps, {})
keymap('n', '<leader>fgb', builtin.git_branches, {})
keymap('n', '<leader>fgc', builtin.git_commits, {})
keymap('n', '<leader>fgs', builtin.git_status, {})
keymap('n', '<leader>fi', "<CMD>:Telescope glyph<CR>")

-- Diffview
keymap("n", "<leader>g", "<CMD>DiffviewToggle<CR>", opts)

-- zenmode
keymap("n", "<leader>z", "<CMD>ZenMode<CR>", opts)

-- nvim-table-md
keymap("n", "<Leader>tf", ':lua require("tablemd").format()<cr>', opts)
keymap("n", "<Leader>tc", ':lua require("tablemd").insertColumn(false)<cr>', opts)
keymap("n", "<Leader>td", ':lua require("tablemd").deleteColumn()<cr>', opts)
keymap("n", "<Leader>tr", ':lua require("tablemd").insertRow(false)<cr>', opts)
keymap("n", "<Leader>tR", ':lua require("tablemd").insertRow(true)<cr>', opts)
keymap("n", "<Leader>tj", ':lua require("tablemd").alignColumn("left")<cr>', opts)
keymap("n", "<Leader>tk", ':lua require("tablemd").alignColumn("center")<cr>', opts)
keymap("n", "<Leader>tl", ':lua require("tablemd").alignColumn("right")<cr>', opts)

-- texlab
keymap("n", "<Leader>lb", '<CMD>TexlabBuild<CR>', opts)
keymap("n", "<Leader>ls", '<CMD>TexlabForward<CR>', opts)

-- Go to lsp.lua to check its keymaps
-- Go to toggleterm.lua to check its keymaps
