local opt = vim.opt

-- Markdown requires indentation of 4 spaces for nested elements
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Visually wrap long lines
opt.wrap = true

-- Disable automatic formatting
opt.formatoptions = ''

-- Disable completion
require('cmp').setup.buffer { enabled = false }
