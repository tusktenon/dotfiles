local opt = vim.opt

opt.colorcolumn = '100'
opt.textwidth = 100

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2


-- Keymaps suggested by haskell-tools.nvim

local ht = require('haskell-tools')
local keymap = vim.keymap.set
local bufnr = vim.api.nvim_get_current_buf()
local def_opts = { silent = true, buffer = bufnr }

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
keymap('n', '<space>ca', vim.lsp.codelens.run, def_opts)

-- Hoogle search for the type signature of the definition under the cursor
keymap('n', '<space>hs', ht.hoogle.hoogle_signature, def_opts)

-- Evaluate all code snippets
keymap('n', '<space>ea', ht.lsp.buf_eval_all, def_opts)

-- Toggle a GHCi repl for the current package
keymap('n', '<leader>rr', ht.repl.toggle, def_opts)

-- Toggle a GHCi repl for the current buffer
keymap('n', '<leader>rf', function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end, def_opts)
keymap('n', '<leader>rq', ht.repl.quit, def_opts)
