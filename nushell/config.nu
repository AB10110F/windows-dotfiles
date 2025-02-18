$env.config.history.file_format = "sqlite"

$env.config.show_banner = false

$env.config.edit_mode = "vi"
# $env.config.buffer_editor = "vi"

$env.config.cursor_shape.emacs = "inherit"
$env.config.cursor_shape.vi_insert = "blink_line"
$env.config.cursor_shape.vi_normal = "blink_block"

$env.config.error_style = "fancy"                                                             # plain or fancy
# $env.config.footer_mode = "never"
$env.config.ls.use_ls_colors = false
$env.config.table.mode = "rounded"                                                            # markdown | rounded | basic | thin

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
      { send: historyhintcomplete }
      { send: menu name: completion_menu }
      { send: menunext }
      { edit: complete }
    ]
  }
}]

$env.config.menus ++= [{
  name: history_menu
  only_buffer_difference: true
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

def gl [] { git log --pretty=%h»¦«%aN»¦«%s»¦«%aD | lines | split column "»¦«" Commit Author Subject Date | upsert Date {|d| $d.Date | into datetime} }

def sl [] { scoop export | from json | get apps | select Name Version Source | table }

def --env yy [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
