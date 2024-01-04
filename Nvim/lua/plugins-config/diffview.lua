require("diffview").setup({
  hooks = {
    diff_buf_win_enter = function()
      vim.opt_local.foldenable = false
    end,
  }
})

vim.api.nvim_create_user_command("DiffviewToggle", function(e)
  local view = require("diffview.lib").get_current_view()

  if view then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen " .. e.args)
  end
end, { nargs = "*" })
