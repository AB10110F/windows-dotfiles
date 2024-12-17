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

-- Increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- Surround
keymap("v", "s(", "xi()<ESC>P", opts)
keymap("v", "s)", "xi()<ESC>P", opts)
keymap("v", "s{", "xi{}<ESC>P", opts)
keymap("v", "s}", "xi{}<ESC>P", opts)
keymap("v", "s[", "xi[]<ESC>P", opts)
keymap("v", "s]", "xi[]<ESC>P", opts)
keymap("v", "s\"", "xi\"\"<ESC>P", opts)
keymap("v", "s\'", "xi\'\'<ESC>P", opts)

keymap("n", "sw(", "ciw()<ESC>P", opts)
keymap("n", "sw)", "ciw()<ESC>P", opts)
keymap("n", "sw{", "ciw{}<ESC>P", opts)
keymap("n", "sw}", "ciw{}<ESC>P", opts)
keymap("n", "sw[", "ciw[]<ESC>P", opts)
keymap("n", "sw]", "ciw[]<ESC>P", opts)
keymap("n", "sw\"", "ciw\"\"<ESC>P", opts)
keymap("n", "sw\'", "ciw\'\'<ESC>P", opts)

keymap("v", "sr(", "<ESC>r)gvo<ESC>r(", opts)
keymap("v", "sr)", "<ESC>r)gvo<ESC>r(", opts)
keymap("v", "sr{", "<ESC>r}gvo<ESC>r{", opts)
keymap("v", "sr}", "<ESC>r}gvo<ESC>r{", opts)
keymap("v", "sr[", "<ESC>r]gvo<ESC>r[", opts)
keymap("v", "sr]", "<ESC>r]gvo<ESC>r[", opts)
keymap("v", "sr\"", "<ESC>r\"gvo<ESC>r\"", opts)
keymap("v", "sr\'", "<ESC>r\'gvo<ESC>r\'", opts)

keymap("v", "sd", "<ESC>xgvo<ESC>x", opts)
keymap("v", "sd", "<ESC>xgvo<ESC>x", opts)

-- Enter visual block
keymap('n', "vb", "<C-v>", opts) -- Ctrl reserved for paste

-- lsp
keymap('n', "<leader>e", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>ca", "<CMD>:lua vim.lsp.buf.code_action()<CR>", opts)

-- Toggle centered line
keymap('n', '<Leader>zz', ':let &scrolloff=999-&scrolloff<CR>', opts)

-- Toggle wrap
keymap('n', '<Leader><TAB>', ':set wrap!<CR>', opts)

-- Easy split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)

-- Replacement for <C-l>
keymap("n", "<C-n>", "<CMD>noh<CR>", opts)

-- Buffers navigation
keymap("n", "<TAB>", "<CMD>bnext<CR>", opts)
keymap("n", "<S-TAB>", "<Cmd>bprevious<CR>", opts)
keymap("n", "<C-c>", "<CMD>bd<CR>", opts)          -- Close buffer
keymap("n", "<leader>cc", "<CMD>%bd|e#<CR>", opts) -- Close all buffers except current


-- Plugins

-- Dashboard
keymap("n", "<leader>d", "<CMD>Dashboard<CR>", opts)

-- NvimTree
keymap("n", "<c-s>", "<CMD>Neotree toggle<CR>", opts)

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

-- Minty
keymap("n", "<C-p>", "<CMD>Huefy<CR>", opts)

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
keymap('n', '<leader>fs', builtin.spell_suggest, {})
keymap('n', '<leader>fn', "<CMD>Telescope notify<CR>", {})
keymap('n', '<leader>fi', "<CMD>Nerdy<CR>")

keymap('n', '<localleader>fm', '<cmd>Telescope thesaurus lookup<CR>')

-- Diffview
keymap("n", "<leader>g", "<CMD>DiffviewToggle<CR>", opts)

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

-- venn
function _G.Toggle_venn()
  local venn_enabled = vim.inspect(vim.b.venn_enabled)
  if venn_enabled == "nil" then
    vim.b.venn_enabled = true
    vim.cmd [[setlocal ve=all]]
    -- draw a line on HJKL keystokes
    vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
    vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
    -- draw a box by pressing "f" with visual selection
    vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
  else
    vim.cmd [[setlocal ve=]]
    vim.api.nvim_buf_del_keymap(0, "n", "J")
    vim.api.nvim_buf_del_keymap(0, "n", "K")
    vim.api.nvim_buf_del_keymap(0, "n", "L")
    vim.api.nvim_buf_del_keymap(0, "n", "H")
    vim.api.nvim_buf_del_keymap(0, "v", "f")
    vim.b.venn_enabled = nil
  end
end

-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true })

-- outline
keymap("n", "<leader>o", "<CMD>Outline<CR>", opts)

-- bufferlist
keymap("n", "<leader>b", "<CMD>BufferList<CR>", opts)

-- Go to toggleterm.lua to check its keymaps
-- Go to textObjects.lua for treesitter Objects keymaps
