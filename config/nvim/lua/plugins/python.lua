-----------------------------------------------------------------------------
-- EDITING SUPPORT PLUGINS
-- some plugins that help with python-specific editing operations

return {
  -- f-strings
  -- - auto-convert strings to f-strings when typing `{}` in a string
  -- - also auto-converts f-strings back to regular strings when removing `{}`
  {
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- better indentation behavior
  -- by default, vim has some weird indentation behavior in some edge cases,
  -- which this plugin fixes
  { "Vimjas/vim-python-pep8-indent" },

  -- select virtual environments
  -- - makes pyright and debugpy aware of the selected virtual environment
  -- - Select a virtual environment with `:VenvSelect`
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      dap_enabled = true, -- makes the debugger work with venv
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
