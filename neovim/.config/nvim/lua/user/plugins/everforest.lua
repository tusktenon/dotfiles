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

* I don't care for the default highlighting of floating windows. Instead, I'll borrow the look of
  Telescope's window, which links `TelescopeBorder` to `Grey` and `TelescopeNormal` to `Normal`.

* In Markdown documents, I like a subtle color for list markers, blue for link text and grey for
  URLs.

* Many of the TreeSitter highlight groups are linked in such a way that aren't italicized,
  even if you've set `everforest_enable_italic`.

* The default coloring for TreeSitter Note, Warning and Danger elements uses bold black text
  against a colored background, which is very effective at getting your attention, but also quite
  ugly.

* Everforest customizes the match-up (`andymass/vim-matchup`) highlight groups, setting them to
  underline matches. However, I think I prefer just linking them to the `MatchParen` group (which
  is match-up's default behaviour).

* I prefer to avoid red for rainbow brackets (`nvim-ts-rainbow`).

The following is taken from the 'How to use custom colors?' section of `:h everforest-faq`.
--]]
cmd [[
function! s:everforest_custom() abort
  let l:palette = everforest#get_palette(g:everforest_background, {})

  " The predefined group `Grey` uses `palette.grey1`
  call everforest#highlight('DarkerGrey', l:palette.grey0, l:palette.none)
  " There are predefined groups for italic (e.g., `BlueItalic`), but not for bold
  " call everforest#highlight('BlueBold', l:palette.blue, l:palette.none, 'bold')
  " call everforest#highlight('PurpleBold', l:palette.purple, l:palette.none, 'bold')
  " call everforest#highlight('RedBold', l:palette.red, l:palette.none, 'bold')

  highlight! link FloatBorder Grey
  highlight! link NormalFloat Normal

  highlight! link markdownListMarker Aqua
  highlight! link markdownOrderedListMarker Aqua
  highlight! link markdownLinkText Blue
  highlight! link markdownUrl DarkerGrey

  highlight! link TSConditional Conditional
  highlight! link TSException Exception
  highlight! link TSFuncBuiltin GreenItalic
  highlight! link TSKeyword Keyword
  highlight! link TSRepeat Repeat

  highlight! link TSNote BlueItalic
  highlight! link TSWarning YellowItalic
  highlight! link TSDanger RedItalic

  highlight! link MatchWord MatchParen
  highlight! link MatchWordCur MatchParen

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
