return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = true
    },

    { "williamboman/mason-lspconfig.nvim", opts = true },
  },
  opts = {
    ensure_installed = {
      "pyright",  -- LSP for python
      "ruff-lsp", -- linter for python (includes flake8, pep8, etc.)
      "mypy",
      "debugpy",  -- debugger
      'taplo',
      "black",    -- formatter
      "isort",    -- organize imports
      "taplo",    -- LSP for toml (for pyproject.toml files)
      'tsserver',
      'html',
      'cssls',
      'tailwindcss',
      'svelte',
      'lua_ls',
      'graphql',
      'emmet_ls',
      'prismals',
      'elixirls',
      'rust_analyzer',

    },
  },
}
