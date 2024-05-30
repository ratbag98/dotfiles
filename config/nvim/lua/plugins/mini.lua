vim.api.nvim_set_keymap("n", "<c-n>", ":lua MiniFiles.open()<CR>", { silent = true, noremap = true })
return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.pairs").setup({})
      require("mini.surround").setup()
      require("mini.git").setup({})
      require("mini.diff").setup({})
      require("mini.files").setup({
        windows = {
          preview = true,
          width_preview = 30,
        },
      })
      local status_line = require("mini.statusline")
      status_line.setup()
      status_line.section_location = function()
        return ""
      end
    end,
  },
}
