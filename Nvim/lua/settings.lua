local o = vim.o

-- Editor Settings

o.number = true               -- show line numbers
o.relativenumber = true       -- use relative numbers
o.autoindent = true           -- copy indent from current line when starting a new line
o.cursorline = true           -- highlight current line
o.expandtab = true            -- convert tabs to spaces
o.tabstop = 4                 -- insert 2 spaces per tab
o.shiftwidth = 4              -- insert 2 spaces per identation
o.termguicolors = true        -- set term gui colors
o.splitright = true           -- force all vertical splits to go to the right of current window
o.splitbelow = true           -- force all horizontal aplits to go below of the current window
o.backup = false              -- don't create a backup
o.swapfile = false            -- don't create a swapfile
o.clipboard ="unnamed"        -- allows nvim to access to the clipboard


-- Powershell

local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end
