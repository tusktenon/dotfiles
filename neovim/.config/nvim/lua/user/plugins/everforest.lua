local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.everforest_background = 'hard'
g.everforest_better_performance = 1
g.everforest_cursor = 'green'
g.everforest_enable_italic = 1
g.everforest_disable_italic_comment = 1
g.everforest_diagnostic_virtual_text = 'colored'
opt.background = 'dark'

--[[
Color adjustments:

* I don't care for the default highlighting of floating windows.
  I prefer the look of Telescope's window, which links `TelescopeNormal`
  to `Normal` and `TelescopeBorder` to `Grey`.

* I also like to avoid red for rainbow brackets (`nvim-ts-rainbow`).

The following is taken from the 'How to use custom colors?' section of
`:h everforest-faq`.
--]]
cmd [[
function! s:everforest_custom() abort
  highlight! link FloatBorder Grey
  highlight! link NormalFloat Normal

  highlight! link rainbowcol1 Fg
  highlight! link rainbowcol2 Aqua
  highlight! link rainbowcol3 Orange
  highlight! link rainbowcol4 Green
  highlight! link rainbowcol5 Yellow
  highlight! link rainbowcol6 Blue
  highlight! link rainbowcol7 Purple
endfunction

augroup EverforestCustom
autocmd!
autocmd ColorScheme everforest call s:everforest_custom()
augroup END
]]
