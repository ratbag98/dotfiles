return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Zettlekasten",
        path = "/Users/rob/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten",
      },
    },
    templates = {
      folder = "Extras/Templates",
    },
  },
}
