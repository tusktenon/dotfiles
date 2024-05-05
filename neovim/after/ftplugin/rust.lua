local bufnr = vim.api.nvim_get_current_buf()

local bufmap = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.buffer = bufnr
  opts.silent = true
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Supports rust-analyzer's grouped code actions
bufmap({ 'n', 'v' }, "<leader>la", function() vim.cmd.RustLsp('codeAction') end, { desc = 'Code action' })

-- This setting applies only when you run the built-in `:RustFmt` command; if you're using a
-- formatter plugin (e.g. Conform), you'll have to configure it separately.
vim.g.rustfmt_options = 'nightly'
