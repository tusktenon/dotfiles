-- A helper function that sets custom defaults for keymaps
local function keymap(mode, lhs, rhs, opts)
    local defaults = {noremap = true, silent = true}
    vim.api.nvim_set_keymap(mode, lhs, rhs,
        vim.tbl_extend('keep', opts or {}, defaults))
end


-- Use <Space> as <Leader> and <LocalLeader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Exit Insert mode with 'jk'
keymap('i', 'jk', '<ESC>')

-- Move by screen lines, not file lines, unless a count is provided
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true})
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true})

-- Stay in indent mode (reselect visual selection after indenting)
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Allow gf to open non-existent files
keymap('', 'gf', ':edit <cfile><CR>')

-- Open the current file in the default program
-- (use 'xdg-open' on Linux and 'open' on Mac)
keymap('n', '<leader>x', ':!xdg-open %<CR><CR>')

-- Better Visual-mode paste: replace visual selection without copying it
keymap('v', 'p', '"_dP')

-- Easier switching between buffers
keymap('n', 'gb', ':ls<CR>:b<Space>')

-- Easier window navigation
keymap('n', '<leader>wh', '<C-w>h')
keymap('n', '<leader>wj', '<C-w>j') 
keymap('n', '<leader>wk', '<C-w>k') 
keymap('n', '<leader>wl', '<C-w>l') 
keymap('n', '<leader>ww', '<C-w>w') 
keymap('t', '<leader>wh', '<C-\\><C-n><C-w>h')
keymap('t', '<leader>wj', '<C-\\><C-n><C-w>j')
keymap('t', '<leader>wk', '<C-\\><C-n><C-w>k')
keymap('t', '<leader>wl', '<C-\\><C-n><C-w>l')
keymap('t', '<leader>ww', '<C-\\><C-n><C-w>w')

-- Edit Neovim configuration
keymap('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>')
keymap('n', '<leader>vr', ':source ~/.config/nvim/init.lua<CR>')

