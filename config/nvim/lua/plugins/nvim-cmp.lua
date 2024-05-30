-- Autocompletion

return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  priority = 100,
  dependencies = {
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-buffer", -- source for text in buffer
    {
      "L3MON4D3/LuaSnip", -- snippet engine
      build = function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
          return
        end
        return "make install_jsregexp"
      end,
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    {
      "rafamadriz/friendly-snippets",
      config = function()
        -- load vscode-style snippets from plugins (eg friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load { paths = vim.fn.stdpath "config" .. "/snippets/" }
      end,
    },
  },
  config = function()
    require "config.completion"
  end,
}
