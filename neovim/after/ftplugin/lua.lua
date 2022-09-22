local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.formatoptions = opt.formatoptions - 'o'  -- Vim adds the 'o' option for Lua files
