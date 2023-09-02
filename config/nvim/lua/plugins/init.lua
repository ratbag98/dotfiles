-- only put simple plugin lines here
-- more complex setup should be in a separate file per plugin
return {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',    opts = {} },

  { 'mbbill/undotree' },

  -- TODO should these be moved into LSP config
  { 'simrat39/rust-tools.nvim' },

}
-- vim: ts=2 sts=2 sw=2 et
