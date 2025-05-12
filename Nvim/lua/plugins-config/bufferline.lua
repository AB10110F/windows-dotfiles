require("bufferline").setup({
  options = {
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    offsets = {
      {
        filetype = "neo-tree",
        text = "",
        highlight = "StatusLine",
        separator = true -- use a "true" to enable the default, or set your own character
      },
    },
    numbers = function(opts)
      return string.format('%s •', opts.ordinal)
    end,
  }
})
