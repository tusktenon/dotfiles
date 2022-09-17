local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.everforest_background = 'hard'
g.everforest_better_performance = 1
g.everforest_cursor = 'green'
g.everforest_disable_italic_comment = 1
g.everforest_diagnostic_virtual_text = 'colored'
opt.background = 'dark'

--[[  I don't care for the default highlighting of floating windows. I prefer
the look of Telescope's window, which links `TelescopeNormal` to `Normal` and
`TelescopeBorder` to `Grey`.

The following is taken from the 'How to use custom colors?' section of
`:h everforest-faq`.  --]]
cmd [[
function! s:everforest_custom() abort
  highlight! link FloatBorder Grey
  highlight! link NormalFloat Normal
endfunction

augroup EverforestCustom
autocmd!
autocmd ColorScheme everforest call s:everforest_custom()
augroup END
]]

-- Must be called last:
-- cmd 'colorscheme everforest'
