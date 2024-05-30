require("config.keymaps")
require("config.lazy")
--
-- make sure you load options after lazy so that colorschemes are in place
require("config.options")

-- TODO rationalise this!
vim.g.python3_host_prog = vim.fn.expand("$HOME/venvs/neovim/bin/python3")
-- vim: ts=2 sts=2 sw=2 et
