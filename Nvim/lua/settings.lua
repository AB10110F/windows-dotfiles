local global = vim.g
local o = vim.o

-- Editor Settings

o.number = true
o.relativenumber = true
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.termguicolors = true
o.splitright = true
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
