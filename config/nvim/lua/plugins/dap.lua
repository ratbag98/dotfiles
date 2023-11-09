return {
  "mfussenegger/nvim-dap",
  keys = {
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Start/Continue Debugger",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Add Breakpoint",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate Debugger",
    },
    {
      "<leader>dus",
      function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      desc = "Open debugging sidebar",
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
