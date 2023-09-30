vim.opt.termguicolors = true
return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    priority = 100, -- less than colorscheme plugin
    config = function()
        require("bufferline").setup {
            -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
            options = {
                mode = "buffers",
                numbers = "ordinal",
                themable = true,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                        tab_size = 0,
                    }
                },
                diagnostics = 'nvim_lsp',
                show_buffer_close_icons = false,
                show_close_icon = false,
            }

        }
    end
}
