-- only put simple plugin lines here
-- more complex setup should be in a separate file per plugin
return {
  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- create a session file, suitable for tmux resurrection
  "tpope/vim-obsession",

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Useful plugin to show you pending keybinds.
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = { window = { border = "single" } },
  },

  { "mbbill/undotree" },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
}
-- vim: ts=2 sts=2 sw=2 et
