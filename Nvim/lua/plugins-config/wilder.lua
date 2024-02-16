local wilder = require('wilder')
wilder.setup({modes = {':'}})

-- wilder.set_option('renderer', wilder.wildmenu_renderer({
--   highlighter = wilder.basic_highlighter(),
-- }))

-- wilder.set_option('renderer', wilder.popupmenu_renderer({
--   pumblend = 50,
-- }))

--Experimental palette theme
wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_palette_theme({
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    border = 'rounded',
    max_height = '50%',      -- max height of the palette
    min_height = 0,          -- set to the same as 'max_height' for a fixed height window
    prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
    reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
  })
))
