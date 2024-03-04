require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "neo-tree",
        text = "NEO-TREE",
        highlight = "Directory",
        separator = true -- use a "true" to enable the default, or set your own character
      },
    },
    numbers = function(opts)
      return string.format('%s', opts.ordinal)
    end,
  }
})
