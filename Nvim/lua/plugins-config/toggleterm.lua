local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}
for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

local status, toggleterm = pcall(require, "toggleterm")

if not status then
  return
end

toggleterm.setup({
  open_mapping = [[<leader>ñ]],
  insert_mappings = false,
  shading_factor = 2,
  direction = "float",
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local Terminal = require('toggleterm.terminal').Terminal

local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })
local ghDash   = Terminal:new({ cmd = "gh dash", hidden = true })
local atac     = Terminal:new({ cmd = "atac", hidden = true })
local gobang   = Terminal:new({ cmd = "gobang", hidden = true })

function _cmd_toggle(n)
  if n == 1 then
    lazygit:toggle()
  elseif n == 2 then
    ghDash:toggle()
  elseif n == 3 then
    atac:toggle()
  elseif n == 4 then
    gobang:toggle()
  end
end

vim.api.nvim_set_keymap("n", "<leader>{", "<cmd>lua _cmd_toggle(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>}", "<cmd>lua _cmd_toggle(2)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>[", "<cmd>lua _cmd_toggle(3)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>]", "<cmd>lua _cmd_toggle(4)<CR>", { noremap = true, silent = true })
