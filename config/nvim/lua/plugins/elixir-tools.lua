return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("elixir").setup({
      nextls = { enable = false },
      credo = { enable = false }, -- use project version instead
      elixirls = {
        enable = true,
        cmd = "/Users/rob/src/elixir-ls/rel/language_server.sh",
        settings = require("elixir.elixirls").settings({
          dialyzerEnabled = true,
          enableTestLenses = true,
          suggestSpecs = true,
        }),
        ---@diagnostic disable-next-line: unused-local
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
