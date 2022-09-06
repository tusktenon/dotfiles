-- Use <Space> as <Leader> and <LocalLeader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set  -- Sets `noremap` by default

-- Exit Insert mode with 'jk'
keymap('i', 'jk', '<ESC>')

-- Move by screen lines, not file lines, unless a count is provided
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true})
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true})

-- Navigate completion menus with <C-j> and <C-k>
keymap('c', '<C-j>', "pumvisible() ? '<C-n>' : '<C-j>'", {expr = true, silent = false})
keymap('c', '<C-k>', "pumvisible() ? '<C-p>' : '<C-k>'", {expr = true, silent = false})

-- Borrowed from Tim Pope's Unimpaired plugin (tpope/vim-unimpaired):
-- Insert newline above/below current line with `[<Space>` and `[<Space>`
keymap('n', '[<Space>', ":<C-u>put!=repeat([''],v:count)<Bar>']+1<CR>", {silent = true})
keymap('n', ']<Space>', ":<C-u>put =repeat([''],v:count)<Bar>'[-1<CR>", {silent = true})

-- Easier switching between buffers
keymap('n', '<leader>bb', ':ls<CR>:b<Space>')

-- Allow gf to open non-existent files
keymap('', 'gf', ':edit <cfile><CR>')

-- Open directory explorer
keymap('n', '<leader>e', ':Lex 30<CR>')

-- Open the current file in the default program
-- (use `xdg-open` on Linux and `open` on Mac)
keymap('n', '<leader>x', ':!open %<CR><CR>')

-- Better Visual-mode paste: replace visual selection without copying it
keymap('v', 'p', '"_dP')

-- Stay in indent mode (reselect Visual selection after indenting)
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Move text up/down in Visual and Visual Block mode
keymap('v', '<M-j>', ":move .+1<CR>==", {silent = true})
keymap('v', '<M-k>', ":move .-2<CR>==", {silent = true})
keymap('x', '<M-j>', ":move '>+1<CR>gv-gv", {silent = true})
keymap('x', '<M-k>', ":move '<-2<CR>gv-gv", {silent = true})

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

-- Resize windows with arrow keys
keymap('n', '<M-Up>', ':resize -2<CR>', {silent = true})
keymap('n', '<M-Down>', ':resize +2<CR>', {silent = true})
keymap('n', '<M-Left>', ':vertical resize -2<CR>', {silent = true})
keymap('n', '<M-Right>', ':vertical resize +2<CR>', {silent = true})

-- Edit Neovim configuration
keymap('n', '<leader>ve', ':edit ~/.config/nvim/init.lua<CR>')
keymap('n', '<leader>vr', ':source ~/.config/nvim/init.lua<CR>')

