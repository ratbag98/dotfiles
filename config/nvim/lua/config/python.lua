-- BASIC PYTHON-RELATED OPTIONS

-- The filetype-autocmd runs a function when opening a file with the filetype
-- "python". This method allows you to make filetype-specific configurations. In
-- there, you have to use `opt_local` instead of `opt` to limit the changes to
-- just that buffer. (As an alternative to using an autocmd, you can also put those
-- configurations into a file `/after/ftplugin/{filetype}.lua` in your
-- nvim-directory.)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python", -- filetype for which to run the autocmd
  callback = function()
    -- use pep8 standards
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4

    -- folds based on indentation https://neovim.io/doc/user/fold.html#fold-indent
    -- if you are a heavy user of folds, consider the using nvim-ufo plugin
    vim.opt_local.foldmethod = "indent"

    -- automatically capitalize boolean values. Useful if you come from a
    -- different language, and lowercase them out of habit.
    vim.cmd.inoreabbrev("<buffer> true True")
    vim.cmd.inoreabbrev("<buffer> false False")

    -- in the same way, we can fix habits regarding comments or None
    vim.cmd.inoreabbrev("<buffer> -- #")
    vim.cmd.inoreabbrev("<buffer> null None")
    vim.cmd.inoreabbrev("<buffer> none None")
    vim.cmd.inoreabbrev("<buffer> nil None")
  end,
})
