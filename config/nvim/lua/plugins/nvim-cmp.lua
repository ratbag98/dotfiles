-- Autocompletion

return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "hrsh7th/cmp-nvim-lsp-signature-help", -- highlight parameter
  },
  config = function()
    local cmp = require("cmp")

    -- load vscode-style snippets from plugins (eg friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/" })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      -- window = {
      --   completion = cmp.config.window.bordered(),
      --   documentation = cmp.config.window.bordered(),
      -- },
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3,
          side_padding = 0,
        },
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_locally_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").locally_jumpable(-1) then
            require("luasnip").jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = "path" }, -- file system paths
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer", keyword_length = 3 }, -- text within current buffer
        { name = "luasnip", keyword_length = 2 }, -- snippets
        { name = "nvim_lsp_signature_help" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      },
      -- formatting = {
      --   fields = { "menu", "abbr", "kind" },
      --   format = require("lspkind").cmp_format({
      --     mode = "symbol_text",
      --     menu = {
      --       path = "[Path]",
      --       buffer = "[Buffer]",
      --       nvim_lsp = "[LSP]",
      --       luasnip = "[LuaSnip]",
      --     },
      --     maxwidth = 50,
      --     ellipsis_char = "...",
      --   }),
      -- },
    })

    -- you can replace `:` with table for multiple mode, e.g. { ':', '/', '?' }
    -- which will affect both ex-mode and search mode command
    -- cmp.setup.cmdline(":", {
    --   completion = {
    --     completeopt = "menu,menuone,noselect",
    --   },
    -- })
  end,
}
