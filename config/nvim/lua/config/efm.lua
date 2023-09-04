require "lspconfig".efm.setup {
  init_options = { documentFormatting = true },
  filetypes = { "lua", "elixir" },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      lua = {
        {
          formatCommand = "lua-format -i",
          formatStdin = true
        }
      }
    }
  }
}
-- vim: ts=2 sts=2 sw=2 et
