local opt = vim.opt

-- Set indentation at 2 spaces
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- Visually wrap long lines
opt.wrap = true

-- Disable completion
require('cmp').setup.buffer { enabled = false }
