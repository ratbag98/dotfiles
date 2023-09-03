vim.opt.termguicolors = true
return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    after = "catppuccin",
    config = function()
        require("bufferline").setup {
            highlights = require("catppuccin.groups.integrations.bufferline").get(),
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
                    }
                },
                diagnostics = 'nvim_lsp',
            }

        }
    end
}
