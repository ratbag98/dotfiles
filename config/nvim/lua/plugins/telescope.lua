-- Fuzzy Finder (files, lsp, etc)
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local actions = require "telescope.actions"

    require("telescope").setup {
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    }

    require("telescope").load_extension "fzf"
    local builtin = require "telescope.builtin"
    local keymap = vim.keymap

    -- See `:help telescope.builtin`
    keymap.set("n", "<leader>sb", builtin.buffers, { desc = "telescope existing buffers" })
    keymap.set("n", "<leader>sf", builtin.find_files, { desc = "telescope files" })
    keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "telescope live grep" })
    keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "telescope Help" })
    keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "telescope keymaps" })
    keymap.set("n", "<leader>sm", builtin.git_commits, { desc = "telescope git commits" })
    keymap.set("n", "<leader>so", builtin.oldfiles, { desc = "telescope recently opened files" })
    keymap.set("n", "<leader>ss", builtin.git_status, { desc = "telescope git status" })
    keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "telescope current Word" })
    keymap.set("n", "<leader>sn", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "telescope neovim config" })
    keymap.set("n", "<leader>sz", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = "telescope fine in current buffer" })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
