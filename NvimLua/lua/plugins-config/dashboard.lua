event = 'VimEnter'
require('dashboard').setup ({
  theme = 'doom',
  config = {
    header = {
      "",
      "",
      "",
      "",
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      "",
      "",
      "",
    },
    center = {
      {
        icon = '  ',
        desc ='New File                         ',
        action =  'new_file',
        shortcut = 'Leader n f'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'b',
        keymap = 'SPC f f',
        key_hl = 'Number',
        action = 'Telescope find_files find_command=rg,--hidden,--files'
      },
      {
        icon = '󰗼  ',
        desc = 'Exit',
        key = 'f',
        keymap = 'SPC t c',
        action = ':q'
      },
    },
    footer = {'Carpe Diem'}
  }
  
})
