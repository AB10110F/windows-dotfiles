local function get_num_wraps()
  local winid = vim.api.nvim_get_current_win()

  local winwidth = vim.api.nvim_win_get_width(winid)
  local numberwidth = vim.wo.number and vim.wo.numberwidth or 0
  local signwidth = vim.fn.exists '*sign_define' == 1 and vim.fn.sign_getdefined() and 2 or 0
  local foldcolumn = vim.wo.foldcolumn
  local foldwidth = tonumber(foldcolumn) or 0

  local bufferwidth = winwidth - numberwidth - signwidth - foldwidth

  local line = vim.fn.getline(vim.v.lnum)
  local line_length = vim.fn.strdisplaywidth(line)

  return math.floor(line_length / bufferwidth)
end

function CheckSymbolOrNumber(current)
  if vim.v.virtnum < 0 then
    return '-'
  end

  if vim.v.virtnum > 0 and (vim.wo.number or vim.wo.relativenumber) then
    local num_wraps = get_num_wraps()
    if vim.v.virtnum == num_wraps then
      return '╰'
    else
      return '│'
    end
  end

  return current
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  callback = function()
    local exclude = { "neo-tree", "dashboard", "toggleterm", "DiffviewFiles", "text", "help", "Outline" }
    local floating = vim.api.nvim_win_get_config(0).relative ~= ""

    if vim.tbl_contains(exclude, vim.bo.filetype) or floating then
      vim.opt_local.statuscolumn = nil
    else
      vim.opt_local.statuscolumn = '%s%C%=%#CursorLineNr#%{(v:relnum == 0)?v:lua.CheckSymbolOrNumber(v:lnum)."' .. '   '
          .. '":""}'
          .. '%#LineNr#%{(v:relnum != 0)?v:lua.CheckSymbolOrNumber(v:relnum)."' .. '  '
          .. '":""}'
    end
  end
})
