return {
  'akinsho/git-conflict.nvim',
  version = '*',
  config = function()
    local gc = require 'git-conflict'
    gc.setup { disable_diagnostics = true }
    vim.api.nvim_exec('GitConflictRefresh', false)
  end,
}
