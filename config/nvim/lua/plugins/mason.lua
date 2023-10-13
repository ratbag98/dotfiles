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
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "pyright", -- LSP for python
        "taplo",
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "elixirls",
        "rust_analyzer",
      },
    })
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "ruff-lsp", -- linter for python (includes flake8, pep8, etc.)
        "stylua",
        "isort",
        "black",
        "debugpy", -- debugger
      },
    })
  end,
}
