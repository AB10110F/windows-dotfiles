require('render-markdown').setup({
  render_modes = { 'n', 'i' },
  heading = {
    icons = { ' ', ' ', ' ', ' ', ' ', ' ' },
    signs = { '󰌕 ' },
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
