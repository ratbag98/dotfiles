vim.api.nvim_set_keymap("n", "<c-n>", ":lua MiniFiles.open()<CR>", { silent = true, noremap = true })
return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.pairs").setup({})
      require("mini.surround").setup({})
      require("mini.comment").setup({})
      require("mini.files").setup({
        windows = {
          preview = true,
          width_preview = 30,
        },
      })
      -- require("mini.animate").setup({
      --   scroll = {
      --     enable = false,
      --   },
      -- })
    end,
  },
}
