local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ensure_installed = {
    "cpp",
    "go",
    "python",
    "php",
    "c",
    "c_sharp",
    "markdown",
    "markdown_inline",
    "typescript",
    "javascript",
    "json",
    "xml",
    "css",
    "scss",
    "html",
    "lua",
    "vim",
    "vimdoc",
    "java",
    "yaml",
    "tsx",
    "rust",
    "sql",
    "latex",
  },
  autotag = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  -- auto_install = true,
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
