return {
  -- auto-insert closing brackets
  {
    "echasnovski/mini.pairs",
    config = function()
      require('mini.pairs').setup {}
    end
  },

  -- navigate regions
  {
    "echasnovski/mini.surround",
    config = function()
      require('mini.surround').setup {}
    end
  },

  -- comment lines with gcc etc.
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup {}
    end
  }
}
