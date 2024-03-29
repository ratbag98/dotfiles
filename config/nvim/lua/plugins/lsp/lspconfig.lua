-- LSP Configuration & Plugins
--
return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },

      -- Useful status updates for LSP
      {
        "j-hui/fidget.nvim",
        opts = { notification = { window = { winblend = 0 } } },
      },
      { "folke/neodev.nvim", opts = {} },
    },
    keys = {
      { "<C-k>", vim.lsp.buf.signature_help, desc = "Signature Documentation" },
      { "<leader>D", vim.lsp.buf.type_definition, desc = "Type [D]efinition" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "[C]ode [A]ction", mode = { "n", "v" } },
      { "<leader>ds", require("telescope.builtin").lsp_document_symbols, desc = "[D]ocument [S]ymbols" },
      { "<leader>rn", vim.lsp.buf.rename, desc = "[R]e[n]ame" },
      { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "[W]orkspace [A]dd Folder" },
      {
        "<leader>wl",
        function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        desc = "[W]orkspace [L]ist Folders",
      },
      { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "[W]orkspace [R]emove Folder" },
      { "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, desc = "[W]orkspace [S]ymbols" },
      { "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
      { "gD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
      { "gI", vim.lsp.buf.implementation, desc = "[G]oto [I]mplementation" },
      { "gd", vim.lsp.buf.definition, desc = "[G]oto [D]efinition" },
      { "gr", require("telescope.builtin").lsp_references, desc = "[G]oto [R]eferences" },
    },
    config = function()
      -- must be loaded before lspconfig
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true },
      })

      -- this snippet enables auto-completion
      local lspconfig = require("lspconfig")
      local lspCapabilities = require("cmp_nvim_lsp").default_capabilities()
      lspCapabilities.textDocument.completion.completionItem.snippetSupport = true

      local servers = { "taplo", "tsserver", "cssls" }

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

      -- configure individual LSP modules with more options
      lspconfig.lua_ls.setup({
        capabilities = lspCapabilities,
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      })

      lspconfig.tailwindcss.setup({
        capabilities = lspCapabilities,
        filetypes = { "html", "eelixir", "heex" },
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

      local _border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = _border,
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = _border,
      })
    end,
  },
}
