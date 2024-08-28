local wilder = require('wilder')
wilder.setup({ modes = { ':', '/', '?' } })


wilder.set_option('renderer', wilder.wildmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  right = { '', wilder.wildmenu_index() },
  highlights = {
    accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#2AC3DE' } }),
  },
  separator = ' | ',
}))
