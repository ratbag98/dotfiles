--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true, notify = true },
  cache = {
    enabled = true,
  },
  reset_packpath = true, -- reset the package path to improve startup time
  performance = {
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        -- "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    -- size = { width = 0.1, height = 0.1 },
    border = "none",
  },
}

-- next bit of initialisation is to automagically require everything
-- in the lue/plugin directory

--
-- TODO rationalise this!
vim.g.python3_host_prog = vim.fn.expand "$HOME/venvs/neovim/bin/python3"
-- vim: ts=2 sts=2 sw=2 et
