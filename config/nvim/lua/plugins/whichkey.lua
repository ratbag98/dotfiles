return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  lazy = true,
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    local wk = require "which-key"
    wk.setup {
      preset = "helix",
      expand = 1,
    }

    -- Document existing key chains
    wk.add {
      { "<leader>s", desc = "Search" },
      { "<leader>v", desc = "Venv" },
    }
  end,
}
