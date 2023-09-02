
return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile"},

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {"antosha417/nvim-lsp-file-operations", config = true},

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      -- must be loaded before lspconfig
      require('neodev').setup({
        library = { plugins = { "neotest" }, types = true },
      })

      local lspconfig = require('lspconfig')

      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local buf = vim.lsp.buf -- for conciseness
      local telescope = require('telescope.builtin') -- for conciseness

      local on_attach = function(_, bufnr)
        -- define a key in NORMAL mode
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, noremap = true, silent = true })
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
      end

      -- enable autocompletions
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- configure individual LSP modules
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig["lua_ls"].setup({
        Lua = {
          workspace = {checkThirdParty = false},
          telemetry = {enable = false},
        }
      })

      lspconfig["elixirls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig["pyright"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure typescript server with plugin
      lspconfig["tsserver"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure tailwindcss server
      lspconfig["tailwindcss"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure svelte server
      lspconfig["svelte"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure prisma orm server
      lspconfig["prismals"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure graphql language server
      lspconfig["graphql"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
      })

      -- configure emmet language server
      lspconfig["emmet_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      })

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        }

      })
    end
  }
}
