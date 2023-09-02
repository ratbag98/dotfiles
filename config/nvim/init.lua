-- ripgrep and fd will definitely need installing before this will work

require('config.keymaps')
require('config.bootstrap_lazy')
require('lazy').setup("plugins")
require('config.options')

require('config.lspconfig')
require('config.telescope')
require('config.cmp_luasnip')

require('config.colorscheme')
-- vim: ts=2 sts=2 sw=2 et
