def "nu-complete git" [] {
    [
        { value: "init",       description: "Create an empty Git repository" }
        { value: "clone",      description: "Clone a repository into a new directory" }
        { value: "switch",     description: "Switch branches" }
        { value: "pull",       description: "Fetch and integrate with another repo" }
        { value: "push",       description: "Update remote refs and objects" }
        { value: "add",        description: "Add file contents to the index" }
        { value: "commit",     description: "Record changes to the repository" }
        { value: "branch",     description: "List, create, or delete branches" }
        { value: "log",        description: "Show commit logs" }
        { value: "diff",       description: "Show changes between commits" }
        { value: "status",     description: "Show the working tree status" }
    ]
}

extern "git" [
    command?: string@"nu-complete git"
    ...args
]

export def get-all-git-local-refs []: nothing -> list<record<ref: string, obj: string, upstream: string, subject: string>> {
  ^git for-each-ref --format '%(refname:lstrip=2)%09%(objectname:short)%09%(upstream:remotename)%(upstream:track)%09%(contents:subject)' refs/heads | lines | parse "{ref}\t{obj}\t{upstream}\t{subject}"
}

export def get-all-git-remote-refs []: nothing -> list<record<ref: string, obj: string, subject: string>> {
  ^git for-each-ref --format '%(refname:lstrip=2)%09%(objectname:short)%09%(contents:subject)' refs/remotes | lines | parse "{ref}\t{obj}\t{subject}"
}

export def get-mergable-sources []: nothing -> list<record<value: string, description: string>> {
  let local = get-all-git-local-refs | each {|x| {value: $x.ref description: $'Branch, Local, ($x.obj) ($x.subject), (if ($x.upstream | is-not-empty) { $x.upstream } else { "no upstream" } )'} } | insert style 'light_blue'
  let remote = get-all-git-remote-refs | each {|x| {value: $x.ref description: $'Branch, Remote, ($x.obj) ($x.subject)'} } | insert style 'blue_italic'
  $local | append $remote
}

def "nu-complete git switch" [] {
  let branches = get-mergable-sources
  {
    options: {
        case_sensitive: false,
        completion_algorithm: prefix,
        sort: false,
    },
    completions: $branches
  }
}

export extern "git switch" [
  switch?: string@"nu-complete git switch"        # name of branch to switch to
  --create(-c)                                    # create a new branch
  --force-create(-C): string                      # forces creation of new branch, if it exists then the existing branch will be reset to starting point
  --guess                                         # if there is no local branch which matches then name but there is a remote one then this is checked out
  --ignore-other-worktrees                        # switch even if the ref is held by another worktree
  --merge(-m)                                     # attempts to merge changes when switching branches if there are local changes
  --no-guess                                      # do not attempt to match remote branch names
  --no-recurse-submodules                         # do not update the contents of sub-modules
  --no-track                                      # do not set "upstream" configuration
  --orphan: string                                # create a new orphaned branch
  --progress                                      # report progress status
  --quiet(-q)                                     # suppress feedback messages
  --recurse-submodules                            # update the contents of sub-modules
  --track(-t)                                     # set "upstream" configuration
]

export extern "git init" [
  --initial-branch(-b): string                    # initial branch name
  --bare: string                                  # bare repository
]

def "nu-complete ffmpeg-input" [] {
    let exts = [
        "mp4" "mkv" "avi" "mov" "webm"
        "mp3" "wav" "flac" "aac"
        "ogg" "m4a" "jpeg" "jpg"
        "gif" "png" "jfif"
    ]

    ls
    | where type == "file"
    | where { |f|
        $exts | any { |e| $f.name | str ends-with $".($e)" }
    }
    | get name
    | each { |n|
        if ($n | str contains " ") {
            $"\"($n)\""
        } else {
            $n
        }
    }
}

export extern "ffmpeg" [
    -i: string@"nu-complete ffmpeg-input"
    ...args
]

def cheat [file: string@"nu-complete cheat"] {
    let path = $"~/Documents/Notes/CheatSheets/($file).md" | path expand

    if ($path | path exists) {
        glow $path
    } else {
        print $"No cheat sheet found for ($file)"
    }
}

def "nu-complete cheat" [] {
    ls ~/Documents/Notes/CheatSheets
    | where name ends-with ".md"
    | get name
    | path basename
    | str replace ".md" ""
}
