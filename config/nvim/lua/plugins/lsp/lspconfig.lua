-- LSP Configuration & Plugins
--
return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },

      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
      { "folke/neodev.nvim", opts = {} },
      { "simrat39/rust-tools.nvim" },
    },
    keys = {
      { "<leader>rn", vim.lsp.buf.rename, desc = "[R]e[n]ame" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "[C]ode [A]ction" },
      { "gd", vim.lsp.buf.definition, desc = "[G]oto [D]efinition" },
      { "gr", require("telescope.builtin").lsp_references, desc = "[G]oto [R]eferences" },
      { "gI", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },
      { "<leader>D", vim.lsp.buf.type_definition, desc = "Type [D]efinition" },
      { "<leader>ds", require("telescope.builtin").lsp_document_symbols, desc = "[D]ocument [S]ymbols" },
      { "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "[W]orkspace [S]ymbols" },

      -- See `:help K` for why this keymap
      { "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
      { "<C-k>", vim.lsp.buf.signature_help, desc = "Signature Documentation" },

      -- Lesser used LSP functionality
      { "gD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
      { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "[W]orkspace [A]dd Folder" },
      {
        "<leader>wr",
        vim.lsp.buf.remove_workspace_folder,
        desc = "[W]orkspace [R]emove Folder",
      },
      {
        "<leader>wl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = "[W]orkspace [L]ist Folders",
      },
    },
    config = function()
      -- this snippet enables auto-completion
      local lspconfig = require("lspconfig")
      local lspCapabilities = vim.lsp.protocol.make_client_capabilities()
      lspCapabilities.textDocument.completion.completionItem.snippetSupport = true

      local servers = { "taplo", "tsserver", "cssls", "svelte", "prismals" }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = lspCapabilities,
        })
      end

      lspconfig.pyright.setup({
        capabilities = lspCapabilities,
        filetypes = { "python" },
        settings = {
          disableOrganizeImports = true,
          analysis = {
            diagnosticMode = "workspace",
          },
        },
      })

      -- ruff uses an LSP proxy, therefore it needs to be enabled as if it
      -- were a LSP. In practice, ruff only provides linter-like diagnostics
      -- and some code actions, and is not a full LSP yet.
      lspconfig.ruff_lsp.setup({
        settings = {
          organizeImports = true,
        },
        -- disable ruff as hover provider to avoid conflicts with pyright
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      })

      lspconfig.html.setup({
        capabilities = lspCapabilities,
        filetypes = { "html", "heex" },
      })

      lspconfig.elixirls.setup({
        cmd = { "elixir-ls" },
        capabilities = lspCapabilities,
        settings = {
          dialyzerEnabled = false,
          fetchDeps = false,
        },
      })

      -- configure individual LSP modules with more options
      lspconfig.lua_ls.setup({
        capabilities = lspCapabilities,
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      })

      lspconfig.graphql.setup({
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        capabilities = lspCapabilities,
      })

      lspconfig.tailwindcss.setup({
        capabilities = lspCapabilities,
        filetypes = { "html", "elixir", "eelixir", "heex" },
        init_options = {
          userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                'class[:]\\s*"([^"]*)"',
              },
            },
          },
        },
      })

      lspconfig.emmet_ls.setup({
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        capabilities = lspCapabilities,
      })

      -- must be loaded before lspconfig
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true },
      })

      require("fidget").setup({
        window = {
          blend = 0,
        },
      })
      require("rust-tools").setup({})
    end,
  },
}
