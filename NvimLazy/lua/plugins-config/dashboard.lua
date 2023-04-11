event = 'VimEnter'
require('dashboard').setup ({
  theme = 'doom',
  config = {
    header = {
      "",
      --[[ " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝", ]]
      
      --[[ "    ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ",
      "     ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
      "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
      "            ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
      "           ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
      "    ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
      "    ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
      "   ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
      "   ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
      "        ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
      "         ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    ", ]]
  
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠊⠀⢨⣷⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠀⠀⣠⡼⠁⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⢎⣤⣶⣿⣿⣡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⣷⠀⢸⡟⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⡀⢀⣰⣻⣿⣿⣿⣿⣧⣼⣽⣿⣯⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⢠⡿⢰⣿⠀⣾⡇⢠⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⢸⣿⣿⣛⣻⣿⣿⣿⣿⣿⡷⣿⣿⣿⣿⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢸⡇⣿⣷⣿⣿⣿⠿⢁⣿⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠈⠉⠋⢀⣻⣿⣿⡟⢻⡏⠛⠀⣹⣿⣿⣷⡄⠀⠀⠀⠀⠀⡀⢀⣀⠀⠀⠀⠀⢸⣌⣿⣿⣿⡿⣯⣟⣲⡿⠃⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠔⠻⣿⡿⠉⠀⠀⠀⣀⣴⣿⣿⣿⣧⠀⠀⠀⢰⣦⣾⣿⣿⣿⣶⣷⣀⡀⠠⣹⣿⣿⣟⡻⢖⣤⡴⠂⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠛⠀⠀⢀⣴⣿⣻⣿⣿⡿⣯⠈⠀⣀⣸⣿⣿⣿⣿⣯⣭⣿⣿⣿⣧⡄⠈⣭⣿⣿⣷⣖⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⣿⣿⣿⣿⢻⣧⣺⣇⣜⣿⣿⣿⣻⣟⠉⠀⠈⢻⣾⣿⣿⣷⠀⠀⠼⢿⣿⣿⣫⡀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⣠⣤⣄⠀⠀⠀⠀⠀⠀⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠈⣿⣿⣽⣿⣢⣷⣤⣘⢻⣿⣿⡇⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠘⠋⠠⠿⢿⣦⣄⣀⠀⠀⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⣿⠿⠃⣿⣄⡀⠀⠀⣠⣿⣿⢿⣿⣿⣿⣿⣧⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠙⢻⣿⣿⣿⣿⠟⠻⠿⠿⠿⠟⠿⠟⠛⠋⠀⠀⠀⠈⠻⢿⣿⣾⣿⠿⠛⠙⠻⠿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "",
      "-.-. .- .-. .--. .    -.. .. . --",
      "",
      "",
    },
    center = {
      {
        icon = '  ',
        icon_hl = 'Title',
        desc ='New File                           ',
        key = 'n',
        action =  'new_file',
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Find File',
        key = 'f',
        keymap = 'CTRL f',
        action = 'Telescope find_files find_command=rg,--hidden,--files'
      },
      {
        icon = '󰒲  ',
        icon_hl = 'Title',
        desc = 'Lazy',
        key = 'l',
        action = 'Lazy'
      },
      {
        icon = '󰒋  ',
        icon_hl = 'Title',
        desc = 'Mason',
        key = 'm',
        action = 'Mason'
      },
      {
        icon = '  ',
        icon_hl = 'Title',
        desc = 'Check Health',
        key = 'c',
        action = 'checkhealth lazy'
      },
      {
        icon = '󰗼  ',
        icon_hl = 'Title',
        desc = 'Exit',
        key = 'q',
        keymap = 'SPC q',
        action = ':q'
      },
    },
    footer = {}
  }
})
