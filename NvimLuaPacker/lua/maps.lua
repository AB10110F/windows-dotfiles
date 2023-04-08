local global = vim.g

vim.keymap.set("n", "<c-b>", "<CMD>Neotree toggle<CR>")
vim.keymap.set("n", "<c-o>", "<CMD>Neotree focus<CR>")


-- Map <leader> = space key

global.mapleader = " "
global.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><TAB>", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

-- Save
vim.keymap.set("n", "<leader>w", "<CMD>w<CR>")

-- Quit
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- Terminal
vim.keymap.set("n", "<leader>ñ", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")

-- Dashboard
vim.keymap.set("n", "<leader>d", "<CMD>Dashboard<CR>")
