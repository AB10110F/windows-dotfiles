local o          = vim.opt

-- Editor Settings

o.number         = true
o.relativenumber = true
o.cursorline     = true       -- highlight current line
o.expandtab      = true       -- convert tabs to spaces
o.tabstop        = 2          -- insert 2 spaces per tab
o.shiftwidth     = 2          -- insert 2 spaces per indentation
o.termguicolors  = true       -- set term GUI colors
o.splitright     = true       -- force all vertical splits to go to the right of current window
o.splitbelow     = true       -- force all horizontal splits to go below of the current window
o.backup         = false      -- don't create a backup
o.swapfile       = false      -- don't create a swap file
o.clipboard      = "unnamed"  -- allows nvim to access to the clipboard
o.diffopt        = "vertical" -- open split diffs vertically
o.scrolloff      = 999
o.spelllang      = { "en_us", "es_mx", "ru" }
o.spell          = true
o.spellsuggest   = { "best" }
o.fillchars      = { eob = ' ' }
o.mouse          = ""
o.showcmd        = false
o.linebreak      = true
o.breakindent    = true
o.breakindentopt = { "shift:2" }
o.nrformats      = [[bin,hex,octal,alpha]]
o.title          = true
o.titlestring    = [[NVIM - %{expand('%:p:h:t')}%{expand('%:t') == '' ? '' : '/'.expand('%:t')} ]]

o.guicursor      =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
