vim.opt.termguicolors = true
return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup {
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
