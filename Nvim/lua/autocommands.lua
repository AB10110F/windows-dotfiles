-- Remove white spaces on save
vim.cmd([[
  augroup noWhiteSpaces
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]])

-- Open help files in vertical split
vim.cmd([[
  augroup verticalHelp
    autocmd!
    autocmd FileType help wincmd L
  augroup END
]])

-- Switch indentation
vim.cmd([[
  augroup setIndent
    autocmd!
    autocmd Filetype cpp,c,python,java, setlocal shiftwidth=4 tabstop=4
  augroup END
]])

-- Restore default terminal emulator cursor
vim.cmd([[
  augroup restoreCursor
    autocmd!
    autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
  augroup END
]])

-- Change conceal level
-- vim.cmd([[
--   augroup concealLevel
--     autocmd!
--     autocmd FileType markdown setlocal conceallevel=1
--   augroup END
-- ]])


-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- Autoformat when saving file
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
