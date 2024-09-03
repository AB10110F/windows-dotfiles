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

-- lazygit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>{", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
