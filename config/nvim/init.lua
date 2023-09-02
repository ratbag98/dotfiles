-- ripgrep and fd will definitely need installing before this will work

require('core.keymaps')
require('core.bootstrap_lazy')
require('lazy').setup("core.plugins")
require('core.options')

require('custom.config.lspconfig')
require('custom.config.telescope')
require('custom.config.cmp_luasnip')

require('core.colorscheme')
-- vim: ts=2 sts=2 sw=2 et
