require('render-markdown').setup({
  heading = {
    icons = { ' ', ' ', ' ', ' ', ' ', ' ' },
    signs = { '󰌕 ' },
    backgrounds = {
      'RenderMarkdownH1Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH3Bg',
      'RenderMarkdownH4Bg',
      'RenderMarkdownH5Bg',
      'RenderMarkdownH6Bg',
    },
    foregrounds = {
      'RenderMarkdownH1',
      'RenderMarkdownH2',
      'RenderMarkdownH3',
      'RenderMarkdownH4',
      'RenderMarkdownH5',
      'RenderMarkdownH6',
    },
  },

  dash = {
    icon = '─',
    highlight = 'RenderMarkdownTableRow',
  },

  bullet = {
    icons = { '󰧞' },
    highlight = 'RenderMarkdownBullet',
  },

  pipe_table = {
    border = {
      '╭', '┬', '╮',
      '├', '┼', '┤',
      '╰', '┴', '╯',
      '│', '─',
    },
    -- Highlight for table heading, delimiter, and the line above
    head = 'RenderMarkdownTableRow',
    -- Highlight for everything else, main table rows and the line below
    row = 'RenderMarkdownTableRow',
    -- Highlight for inline padding used to add back concealed space
    filler = 'RenderMarkdownTableFill',
  },
})
