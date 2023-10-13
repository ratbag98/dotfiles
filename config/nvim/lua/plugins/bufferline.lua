vim.opt.termguicolors = true

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  priority = 100, -- less than colorscheme plugin
  config = function()
    require("bufferline").setup({
      -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        mode = "buffers",
        numbers = "none",
        themable = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
            tab_size = 0,
          },
        },
        diagnostics = "nvim_lsp",
        -- rest of config ...

        --- count is an integer representing total count of errors
        --- level is a string "error" | "warning"
        --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")
        --  to number of errors for each level.
        --- this should return a string
        --- Don't get too fancy as this function will be executed a lot
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })
  end,
}
