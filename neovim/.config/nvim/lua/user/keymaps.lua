local keymap = vim.keymap.set  -- Sets `noremap` by default
local close_buffers = require 'close_buffers'
local telescope = require 'telescope'
local telescope_builtin = require 'telescope.builtin'
local telescope_custom = require 'user.plugins.telescope'

-- Use <Space> as <Leader> and <LocalLeader>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- General Mappings  {{{1

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
keymap('n', '[<Space>', ":<C-u>put!=repeat([''],v:count)<Bar>']+1<CR>", {desc = 'Add newline above', silent = true})
keymap('n', ']<Space>', ":<C-u>put =repeat([''],v:count)<Bar>'[-1<CR>", {desc = 'Add newline below', silent = true})

-- Allow gf to open non-existent files
keymap('', 'gf', ':edit <cfile><CR>')

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


-- Leader-Prefixed Mappings  {{{1

-- Top-Level  {{{2

-- Open the current file in the default program
-- (use `xdg-open` on Linux and `open` on Mac)
keymap('n', '<leader>x', ':!open %<CR><CR>')


-- Buffers  {{{2
-- keymap('n', '<leader>bb', ':ls<CR>:b<Space>', {desc = 'Switch buffers'})
keymap('n', '<leader>bb', telescope_builtin.buffers, {desc = 'Switch buffers'})
keymap('n', '<leader>bd', function() close_buffers.delete({type = 'this'}) end, {desc = 'Delete buffer'})
keymap('n', '<leader>bH', function() close_buffers.delete({type = 'hidden'}) end, {desc = 'Delete hidden buffers'})
keymap('n', '<leader>bO', function() close_buffers.delete({type = 'other'}) end, {desc = 'Delete other buffers'})
keymap('n', '<leader>bn', ':bn<cr>', {desc = 'Next buffer'})
keymap('n', '<leader>bp', ':bp<cr>', {desc = 'Previous buffer'})


-- Files/Find  {{{2
keymap('n', '<leader>fa', telescope_custom.find_all, {desc = 'Find all files'})
-- keymap('n', '<leader>fe', ':Lex 30<CR>', {desc = 'Toggle explorer'})
keymap('n', '<leader>fe', ':NvimTreeToggle<cr>', {desc = 'Toggle explorer'})
keymap('n', '<leader>ff', telescope_builtin.find_files, {desc = 'Find files'})
keymap('n', '<leader>fr', telescope_builtin.oldfiles, {desc = 'Recent files'})


-- Search  {{{2
keymap('n', '<leader>ss', telescope_builtin.live_grep, {desc = 'Search for string'})
-- keymap('n', '<leader>ss', telescope.extensions.live_grep_args.live_grep_args)
keymap('n', '<leader>so', telescope.extensions.heading.heading, {desc = 'Outline'})
keymap('n', '<leader>sw', telescope_builtin.grep_string, {desc = 'Search for string under cursor'})


-- Windows   {{{2
keymap('n', '<leader>wb', '<C-w>b', {desc = 'Go to bottom-right'})
keymap('n', '<leader>wc', '<C-w>c', {desc = 'Close window'})
keymap('n', '<leader>wh', '<C-w>h', {desc = 'Go left'})
keymap('n', '<leader>wj', '<C-w>j', {desc = 'Go down'})
keymap('n', '<leader>wk', '<C-w>k', {desc = 'Go up'})
keymap('n', '<leader>wl', '<C-w>l', {desc = 'Go right'})
keymap('n', '<leader>wo', '<C-w>o', {desc = 'Close others'})
keymap('n', '<leader>wp', '<C-w>p', {desc = 'Go to previous'})
keymap('n', '<leader>ws', '<C-w>s', {desc = 'Split below'})
keymap('n', '<leader>wt', '<C-w>t', {desc = 'Go to top-left'})
keymap('n', '<leader>wv', '<C-w>v', {desc = 'Split right'})
keymap('n', '<leader>ww', '<C-w>w', {desc = 'Go down/right'})
keymap('n', '<leader>wW', '<C-w>W', {desc = 'Go up/left'})
keymap('n', '<leader>w=', '<C-w>=', {desc = 'Balance windows'})
keymap('t', '<leader>wc', '<C-\\><C-n><C-w>c')
keymap('t', '<leader>wh', '<C-\\><C-n><C-w>h')
keymap('t', '<leader>wj', '<C-\\><C-n><C-w>j')
keymap('t', '<leader>wk', '<C-\\><C-n><C-w>k')
keymap('t', '<leader>wl', '<C-\\><C-n><C-w>l')
keymap('t', '<leader>wo', '<C-\\><C-n><C-w>o')
keymap('t', '<leader>ws', '<C-\\><C-n><C-w>s')
keymap('t', '<leader>wv', '<C-\\><C-n><C-w>v')
keymap('t', '<leader>ww', '<C-\\><C-n><C-w>w')

-- Resize windows with arrow keys
keymap('n', '<M-Up>', ':resize -2<CR>', {desc = 'Decrease width', silent = true})
keymap('n', '<M-Down>', ':resize +2<CR>', {desc = 'Increase width', silent = true})
keymap('n', '<M-Left>', ':vertical resize -2<CR>', {desc = 'Decrease height', silent = true})
keymap('n', '<M-Right>', ':vertical resize +2<CR>', {desc = 'Increase height', silent = true})


-- vim: et sw=2 ts=2 sts=2 fdm=marker
