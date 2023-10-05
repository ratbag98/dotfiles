-- Formatting client: conform.nvim
-- - configured to use black & isort in python
-- - use the taplo-LSP for formatting in toml
-- - Formatting is triggered via `<leader>f`, but also automatically on save
return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- load the plugin before saving
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ lsp_fallback = true, timeout_ms = 500 })
      end,
      desc = "Format",
    },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- first use isort and then black
        python = { "isort", "black" },
        lua = { "stylua" },
      },
      -- enable format-on-save
      format_on_save = {
        -- when no formatter is setup for a filetype, fallback to formatting
        -- via the LSP. This is relevant e.g. for taplo (toml LSP), where the
        -- LSP can handle the formatting for us
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
