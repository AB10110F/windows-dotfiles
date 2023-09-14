local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	ensure_installed = {
    "cpp",
    "go",
    "python",
    "javascript",
    "php",
    "c",
	"markdown",
    "markdown_inline",
	"typescript",
	"javascript",
	"c_sharp",
	"json",
	"css",
    "scss",
	"html",
	"lua",
    "vim",
	},
	autotag = { enable = true },
	incremental_selection = { enable = true },
	indent = { enable = true },
	auto_install = true,
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }