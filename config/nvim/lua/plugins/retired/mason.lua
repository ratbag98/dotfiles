return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = true,
    },

    { "williamboman/mason-lspconfig.nvim", opts = true },
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        -- "pyright", -- LSP for python
        -- "taplo", -- LSP for TOML files
        -- "tsserver",
        -- "html",
        -- "cssls",
        -- "tailwindcss", -- used by PragProg LiveView course
        -- "lua_ls",
      },
    })
    mason_tool_installer.setup({
      ensure_installed = {
        -- "prettier",
        -- "ruff-lsp", -- linter for python (includes flake8, pep8, etc.)
        -- "stylua",
        -- "black",
        -- "debugpy", -- debugger
      },
    })
  end,
}
