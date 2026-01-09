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

def run [file: string] {
    let exec = ($file | path basename | str replace '.cpp' '')
    let compile = (g++ -std=c++17 -Wall -Wpedantic -o $exec $file | complete)

    if $compile.exit_code == 0 {
        print "╭────────────────────────╮"
        print "│ Compilation successful │"
        print "╰────────────────────────╯\n"
        let exec_dot = $exec + ".exe"

        if ($exec_dot | path exists) {
            ^$exec
        } else {
            print "╭──────────────────────╮"
            print "│ Executable not found │"
            print "╰──────────────────────╯\n"
        }
    } else {
        print $'(ansi red)╭────────────────────╮'
        print "│ Compilation failed │"
        print "╰────────────────────╯\n"
        print $compile
    }
}

def gl [] { git log --pretty=%h»¦«%aN»¦«%s»¦«%aD | lines | reverse | split column "»¦«" Commit Author Subject DateTime |
    insert Date {|d| $d.DateTime | into datetime | format date "%Y-%m-%d"} |
    insert Time {|d| $d.DateTime | into datetime | format date "%H:%M:%S"} |
    select Commit Author Subject Date Time
}

def gb [] { git branch -a --format='%(refname) %(refname:short) %(objectname:short) %(upstream:short)' | lines |
    split column ' ' full_ref name commit upstream |
    where full_ref !~ 'refs/remotes/origin/HEAD' |
    each { |row|
        let location = if ($row.full_ref | str starts-with 'refs/remotes/') { 'remote' } else { 'local' }
        let upstream = if ($row.upstream != "") { $"(ansi yellow)→($row.upstream)(ansi reset)" } else { "" }
        $row | upsert location $location | upsert upstream $upstream
    } |
    reject full_ref |
    table
}

def gs [
  --untracked (-u): string = "normal" # Show untracked files. {no, normal, all}
  --ignored (-i): string = "no" # Show ignored files. {traditional, no, matching}
  ...rest
] {
  print "• use \"git add <file>...\" to update what will be committed"
  print "• use \"git restore <file>...\" to discard changes in working directory"
  print "• use \"git add <file>...\" to include in what will be committed"

  ^git status -s --untracked-files=($untracked) --ignored=($ignored) ...$rest
  | lines
  | parse --regex '^(?P<ST>.)(?P<US>.)\s+(?:(?P<old_name>.+?(?=\s->\s))\s->\s)?(?P<name>.+)$'
  | update name {
      let name = $in
      if ($name | str ends-with "/") {
        $"(ansi cyan_bold)($name | str trim --right --char "/")(ansi reset)"
      } else {
        $name
      }
    }
  | update ST { style-status }
  | update US { style-status }
}

def style-status [] {
  let status = $in
  match $status {
    " " => $"(ansi white_bold)-(ansi reset)"
    "!" => $"(ansi yellow)!(ansi reset)"
    "?" => $"(ansi red)?(ansi reset)"
    "A" => $"(ansi green)A(ansi reset)"
    "D" => $"(ansi red_bold)D(ansi reset)"
    "C" => $"(ansi magenta)C(ansi reset)"
    "M" => $"(ansi cyan)M(ansi reset)"
    "m" => $"(ansi cyan)m(ansi reset)"
    "R" => $"(ansi blue)R(ansi reset)"
    "T" => $"(ansi purple)R(ansi reset)"
    "U" => $"(ansi blue)U(ansi reset)"
    _ => $status
  }
}

def "git graph" [] { git tab log0 }

# alias the built in ls command so we don't shadow it
alias ls-builtin = ls

# List the filenames, sizes, and modification times of items in a directory.
@category filesystem
@search-terms dir
@example "List the files in the current directory" { ls }
@example "List visible files in a subdirectory" { ls subdir }
@example "List visible files with full path in the parent directory" { ls -f .. }
@example "List Rust files" { ls *.rs }
@example "List files and directories whose name do not contain 'bar'" { ls | where name !~ bar }
@example "List the full path of all dirs in your home directory" { ls -a ~ | where type == dir }
@example "List only the names (not paths) of all dirs in your home directory which have not been modified in 7 days" { ls -as ~ | where type == dir and modified < ((date now) - 7day) }
@example "Recursively list all files and subdirectories under the current directory using a glob pattern" { ls -a **/* }
@example "Recursively list *.rs and *.toml files using the glob command" { ls ...(glob **/*.{rs,toml}) }
@example "List given paths and show directories themselves" { ['/path/to/directory' '/path/to/file'] | each {|| ls -D $in } | flatten }
def ls [
    --all (-a),         # Show hidden files
    --long (-l),        # Get all available columns for each entry (slower; columns are platform-dependent)
    --short-names (-s), # Only print the file names, and not the path
    --full-paths (-f),  # display paths as absolute paths
    --du (-d),          # Display the apparent directory size ("disk usage") in place of the directory metadata size
    --directory (-D),   # List the specified directory itself instead of its contents
    --mime-type (-m),   # Show mime-type in type column instead of 'file' (based on filenames only; files' contents are not examined)
    --threads (-t),     # Use multiple threads to list contents. Output will be non-deterministic.
    ...pattern: glob,   # The glob pattern to use.
]: [ nothing -> table ] {
    let pattern = if ($pattern | is-empty) { [ '.' ] } else { $pattern }
    (ls-builtin
        --all=$all
        --long=$long
        --short-names=$short_names
        --full-paths=$full_paths
        --du=$du
        --directory=$directory
        --mime-type=$mime_type
        --threads=$threads
        ...$pattern
    ) | sort-by type name -i
}
