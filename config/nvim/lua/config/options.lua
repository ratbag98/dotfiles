-- [[ Setting options ]]
-- See `:help vim.o`
local opt = vim.opt

opt.inccommand = "split"

-- Set highlight on search
opt.hlsearch = false
opt.showmatch = true

-- Make line numbers default and display relative to current line
vim.wo.number = true
vim.wo.relativenumber = false

-- Enable mouse mode
opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = "unnamedplus"

-- Don't have `o` add a comment
opt.formatoptions:remove "o"

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- opt.completeopt = "menuone,noselect,preview,noinsert"
-- opt.completeopt = "menuone,noselect,preview,noinsert"

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

-- Treesitter folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldnestmax = 10
vim.wo.foldenable = false
vim.wo.foldlevel = 2

vim.diagnostic.config {
  virtual_text = false,
  float = {
    border = "rounded",
    -- source = "always",
    focusable = true,
  },
  signs = true,
  underline = false,
  update_in_insert = false,
  severity_sort = true,
}

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.cmd [[ let g:loaded_perl_provider = 0 ]]
