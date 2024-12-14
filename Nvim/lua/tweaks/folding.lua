function FoldText()
  local line = vim.fn.getline(vim.v.foldstart)
  local numOfLines = vim.v.foldend - vim.v.foldstart
  local fillCount = vim.api.nvim_win_get_width(0) - #line - #tostring(numOfLines)

  if fillCount < 0 then
    fillCount = 0
  end

  return '├─  ' .. numOfLines .. ' L ─┤ ' .. line .. '...' .. string.rep(' ', fillCount)
end

vim.opt.foldtext = 'v:lua.FoldText()'

vim.o.foldcolumn = 'auto'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
