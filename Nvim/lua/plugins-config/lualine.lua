local wordCount = function()
  if vim.bo.filetype == 'md' or vim.bo.filetype == 'text' or vim.bo.filetype == 'markdown' or vim.bo.filetype == 'tex' then
    if vim.fn.wordcount().visual_words == 1 then
      return '%=' .. tostring(vim.fn.wordcount().visual_words) .. ' word'
    elseif not (vim.fn.wordcount().visual_words == nil) then
      return '%=' .. tostring(vim.fn.wordcount().visual_words) .. ' words'
    else
      return '%=' .. tostring(vim.fn.wordcount().words) .. ' words'
    end
  else
    return ''
  end
end

local lines = function()
  return vim.api.nvim_buf_line_count(0) .. 'L'
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 3) end } },
    lualine_b = { 'branch', { 'diff', symbols = { added = '󰐗 ', modified = ' ', removed = ' ' } }, 'diagnostics' },
    lualine_c = { wordCount },
    lualine_x = { { 'lsp_status', icon = '󰒋', symbols = { done = '', separator = ', ', }, }, { 'filesize', icon = ' ' }, lines --[[ 'encoding' ]] },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
