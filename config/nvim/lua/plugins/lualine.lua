return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup
    {
      -- See `:help lualine.txt`
      options = {
        icons_enabled = true,
        theme = 'tokyonight',
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
      },
    }
  end
}
