require("markview").setup({
  buf_ignore = { "nofile" },
  modes = { "n" },

  checkboxes = {
    enable = true,
    checked = { text = "", hl = "@markup.list.checked" },
    unchecked = { text = "", hl = "@markup.list.unchecked" }
  },
});
