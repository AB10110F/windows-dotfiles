local o = vim.o

-- Editor Settings

o.number = true               -- show line numbers
o.relativenumber = true       -- use relative numbers
o.autoindent = true           -- copy indent from current line when starting a new line
o.cursorline = true           -- highlight current line
o.expandtab = true            -- convert tabs to spaces
o.tabstop = 4                 -- insert 4 spaces per tab
o.shiftwidth = 4              -- insert 4 spaces per indentation
o.termguicolors = true        -- set term GUI colors
o.splitright = true           -- force all vertical splits to go to the right of current window
o.splitbelow = true           -- force all horizontal splits to go below of the current window
o.backup = false              -- don't create a backup
o.swapfile = false            -- don't create a swap file
o.clipboard ="unnamed"        -- allows nvim to access to the clipboard
o.diffopt = "vertical"        -- open split diffs vertically
o.scrolloff = 999             -- keeps current line on center
vim.opt.spelllang = { "en_us", "es_mx", "ru" } -- spellcheck for this iso-languages
o.spell = true                -- Enable spellcheck
vim.opt.spellsuggest = {"best"}
vim.opt.fillchars = { eob = ' ' } -- Hide ~ on for blank lines
