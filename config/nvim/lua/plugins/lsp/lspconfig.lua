-- LSP Configuration & Plugins
--
return {
  {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile"},

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {"antosha417/nvim-lsp-file-operations", config = true},

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      { "folke/neodev.nvim", opts = {} },
      { 'simrat39/rust-tools.nvim' },
    },
    config = function()
      -- must be loaded before lspconfig
      require('neodev').setup({
        library = { plugins = { "neotest" }, types = true },
      })

      require('fidget').setup {
        window = {
          blend = 0,
        },
      }
      require('rust-tools').setup {}

      local lspconfig = require('lspconfig')

      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local buf = vim.lsp.buf -- for conciseness
      local telescope = require('telescope.builtin') -- for conciseness

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- define a key in NORMAL mode
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = ev.buffer, desc = desc, noremap = true, silent = true })
          end

          nmap('<leader>rn', buf.rename, '[R]e[n]ame')
          nmap('<leader>ca', buf.code_action, '[C]ode [A]ction')

          nmap('gd', buf.definition, '[G]oto [D]efinition')
          nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
          nmap('gI', buf.implementation, '[G]oto [I]mplementation')
          nmap('<leader>D', buf.type_definition, 'Type [D]efinition')
          nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
          nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- See `:help K` for why this keymap
          nmap('K', buf.hover, 'Hover Documentation')
          nmap('<C-k>', buf.signature_help, 'Signature Documentation')

          -- Lesser used LSP functionality
          nmap('gD', buf.declaration, '[G]oto [D]eclaration')
          nmap('<leader>wa', buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          nmap('<leader>wr', buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          nmap('<leader>wl', function()
            print(vim.inspect(buf.list_workspace_folders()))
          end, '[W]orkspace [L]ist Folders')
        end,
      })

      -- enable autocompletions
      local capabilities = cmp_nvim_lsp.default_capabilities()

      local servers = { 'html', 'elixirls', 'pyright', 'tsserver', 'cssls', 'tailwindcss', 'svelte', 'prismals'}

      -- most servers just need a simple setup
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities
        }
      end

      -- configure individual LSP modules with more options
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        Lua = {
          workspace = {checkThirdParty = false},
          telemetry = {enable = false},
        }
      }

      lspconfig.graphql.setup {
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        capabilities = capabilities,
      }

      lspconfig.emmet_ls.setup {
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        capabilities = capabilities,
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = { -- custom settings for lua
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        }
      }
      -- end of LSP module setup
    end
  }
}
