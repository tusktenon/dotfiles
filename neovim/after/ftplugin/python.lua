-- See PEP 8 Style Guide (https://peps.python.org/pep-0008/)

local opt = vim.opt

opt.colorcolumn = '80'
opt.textwidth = 79

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- See https://stackoverflow.com/questions/18948491/running-python-code-in-vim
vim.keymap.set('n', '<leader>cr', ":up<CR>:exec '!python3' shellescape(@%, 1)<CR>", {desc = 'Run file'})
