require('render-markdown').setup({
  render_modes = { 'n', 'i' },
  heading = {
    icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' },
    signs = { '󰌕 ' },
  },

  code = {
    width = 'block',
    min_width = 30,
    right_pad = 4,
  },

  dash = {
    icon = '─',
    highlight = 'RenderMarkdownTableRow',
  },

  bullet = {
    icons = { '󰧞' },
    highlight = 'RenderMarkdownBullet',
  },

  pipe_table = { preset = 'round' },
})
