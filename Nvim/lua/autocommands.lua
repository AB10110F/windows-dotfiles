-- Another way to center the cursor
-- vim.cmd([[
--   augroup CenterCursor
--     autocmd!
--     autocmd CursorMoved * :exec "norm zz"
--   augroup END
-- ]])

-- Remove whitespaces on save
vim.cmd([[
  augroup noWhitespaces
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
  augroup END
]])
