-- Configuration for the python debugger
-- - configures debugpy for us
-- - uses the debugpy installation from mason
return {
  "mfussenegger/nvim-dap-python",
  dependencies = "mfussenegger/nvim-dap",
  config = function()
    -- uses the debugypy installation by mason
    local debugpyPythonPath = require("mason-registry").get_package("debugpy"):get_install_path()
        .. "/venv/bin/python3"
    require("dap-python").setup(debugpyPythonPath, {})
  end,
}
-- vim: ts=2 sts=2 sw=2 et
