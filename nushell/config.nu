$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 1000

$env.config.show_banner = false

$env.config.edit_mode = "vi"
$env.config.buffer_editor = "nvim"

$env.config.cursor_shape.emacs = "inherit"
$env.config.cursor_shape.vi_insert = "blink_line"
$env.config.cursor_shape.vi_normal = "blink_block"

$env.config.error_style = "fancy"                          # plain or fancy
$env.config.ls.use_ls_colors = false
$env.config.table.mode = "rounded"                         # markdown | rounded | basic | thin

$env.config.hooks.command_not_found = [
    # this hook is a workaround, it deletes the last command
    {||
        let id = open $nu.history-path
        | query db "SELECT max(id) FROM history"
        | get "max(id)" | $in.0
        open $nu.history-path
        | query db $"DELETE FROM history WHERE id == ($id);"
    }
]

$env.config.hooks.pre_execution = [
    {
        open $nu.history-path
        | query db "DELETE FROM history WHERE id NOT IN (SELECT MAX(id) FROM history AS h2 WHERE h2.command_line = history.command_line GROUP BY h2.command_line);"
        ignore
 }
]

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = ""

$env.config.keybindings ++= [{
  name: "super_tab"
  modifier: "none"
  keycode: "tab"
  mode: [ emacs, vi_normal, vi_insert ]
  event: {
    until: [
      # { send: historyhintcomplete }
      { send: menu name: completion_menu }
      { send: menunext }
      { edit: complete }
    ]
  }
}]

$env.config.menus ++= [{
    name: completion_menu
    only_buffer_difference: false # Search is done on the text written after activating the menu
    marker: ""                    # Indicator that appears with the menu is active
    type: {
        layout: ide               # list | description | ide | columnar
        columns: 4                # Number of columns where the options are displayed
        col_width: 40             # Optional value. If missing all the screen width is used to calculate column width
        col_padding: 2            # Padding between columns
    }
    style: {
        text: blue
        selected_text: green_reverse
        description_text: yellow
    }
},
{
    name: history_menu
    only_buffer_difference: false
    marker: " "
    type: {
      layout: list
    }
    style: {
      text: blue
      selected_text: green_reverse
      description_text: white
    }
}]

$env.BAT_THEME = "tokyonight_storm"
$env.ATAC_KEY_BINDINGS = "~\\AppData\\Roaming\\Julien-cpsn\\ATAC\\vim_key_bindings.toml"

source aliases.nu
source completions.nu
