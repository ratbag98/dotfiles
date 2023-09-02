return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup
    {
      -- See `:help lualine.txt`
      opts = {
        options = {
          icons_enabled = false,
          theme = 'auto',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = {
            {
              'filename',
              path = 1,
            }
          }
        }
      },
    }
  end
}
