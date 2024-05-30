-- local bufnr = vim.api.nvim_get_current_buf()
-- vim.keymap.set("n", "<leader>k", function()
--   vim.cmd.RustLsp("codeAction")
-- end, { silent = true, buffer = bufnr })
vim.g.rustaceanvim = {
  tools = {
    hover_actions = {
      auto_focus = true,
      replace_builtin_hover = true,
    },
  },
}
