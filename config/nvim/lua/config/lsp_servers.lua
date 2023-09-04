-- LSP configuration outside of the main config function


local buf = vim.lsp.buf                        -- for conciseness
local telescope = require('telescope.builtin') -- for conciseness

local on_attach = function(client, bufnr)
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

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- Create auto commands to automatically run format on save
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- enable autocompletions
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = { 'pyright', 'tsserver', 'cssls', 'tailwindcss', 'svelte', 'prismals' }

-- most servers just need a simple setup
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "heex" }
}

lspconfig.elixirls.setup {
  cmd = { "elixir-ls" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    dialyzerEnabled = false,
    fetchDeps = false,
  }

}

-- configure individual LSP modules with more options
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  }
}

lspconfig.graphql.setup {
  filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.emmet_ls.setup {
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  }
}
-- end of LSP module setup
-- vim: ts=2 sts=2 sw=2 et
