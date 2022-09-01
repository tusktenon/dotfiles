local cmd = vim.cmd
local opt = vim.opt

-- [[ Appearance & Interface ]]

opt.cmdheight = 2      -- Use two screen lines for the command line (helps avoid 'hit enter' prompts)
opt.confirm = true     -- Present a dialog instead of failing a command due to unsaved changes
opt.linebreak = true   -- When `wrap` is on, visually break lines only at specific characters
opt.mouse = 'a'        -- Enable mouse support in all modes
opt.scrolloff = 4      -- Keep some lines visible above/below the cursor
opt.sidescrolloff = 4  -- Keep some columns visible to the left/right of the cursor
opt.showmatch = true   -- Show matching brace/bracket/parenthesis
opt.splitbelow = true  -- Open new windows below the current one
opt.splitright = true  -- Open new windows to the right of the current one
opt.termguicolors = true   -- 24-bit color support in the TUI

cmd('colorscheme nord')    -- Set colorscheme

-- Hightlight selection on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    -- group = vim.api.nvim_create_augroup('highlight_yank'),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { timeout=250 }
    end,
})

-- Display relative line numbers,
-- but switch to absolute line numbers when a window loses focus
opt.number = true
opt.relativenumber = true
cmd([[
    augroup number-toggle
        autocmd!
        autocmd WinEnter * set relativenumber
        autocmd WinLeave * set norelativenumber
    augroup END
]])


-- [[ Searching ]]

opt.ignorecase = true  -- Use case-insensitive search
opt.smartcase = true   -- Override 'ignorecase' when search pattern contains uppercase characters

-- Highlight search matches only while searching
cmd([[
    augroup incsearch-highlight-toggle
        autocmd!
        autocmd CmdlineEnter /,\? :set hlsearch
        autocmd CmdlineLeave /,\? :set nohlsearch
    augroup END
]])


-- [[ Tabs & Indentation ]]

opt.expandtab = true  -- Insert spaces instead of tab characters
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftround = true
opt.smartindent = true
opt.smarttab = true
