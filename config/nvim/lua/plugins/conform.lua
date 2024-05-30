-- Formatting client: conform.nvim
-- - configured to use black in python
-- - use the taplo-LSP for formatting in toml
-- - Formatting is triggered via `<leader>f`, but also automatically on save
return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ lsp_fallback = true, timeout_ms = 500 })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      python = { "black" },
      lua = { "stylua" },
      nix = { "nixpkgs-fmt" },
    },
    -- enable format-on-save
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      return {
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        timeout_ms = 500,
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
