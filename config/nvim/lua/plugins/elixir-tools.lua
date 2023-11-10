return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("elixir").setup({
      nextls = { enable = true },
      credo = { enable = false }, -- use project version instead
      elixirls = {
        enable = true,
        settings = require("elixir.elixirls").settings({
          dialyzerEnabled = true,
          enableTestLenses = false,
        }),
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
