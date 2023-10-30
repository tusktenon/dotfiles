set background=dark
let g:everforest_background = 'hard'
let g:everforest_better_performance = 1
let g:everforest_cursor = 'green'
let g:everforest_enable_italic = 1
let g:everforest_disable_italic_comment = 1
let g:everforest_diagnostic_virtual_text = 'colored'


" Color Adjustments
" See the 'How to use custom colors?' section of `:h everforest-faq`

function! s:everforest_custom() abort
  let l:palette = everforest#get_palette(g:everforest_background, {})

  " The predefined group `Grey` uses `palette.grey1`
  call everforest#highlight('DarkerGrey', l:palette.grey0, l:palette.none)
  " There are predefined groups for italic (e.g., `BlueItalic`), but not for bold
  " call everforest#highlight('BlueBold', l:palette.blue, l:palette.none, 'bold')
  " call everforest#highlight('PurpleBold', l:palette.purple, l:palette.none, 'bold')
  " call everforest#highlight('RedBold', l:palette.red, l:palette.none, 'bold')

  " I don't care for the default highlighting of floating windows.
  " Instead, I'll borrow the look of Telescope's window, which links
  " `TelescopeBorder` to `Grey` and `TelescopeNormal` to `Normal`.
  highlight! link FloatBorder Grey
  highlight! link NormalFloat Normal

  " HTML:
  highlight! link TSTag Aqua
  highlight! link TSTagDelimiter Green
  highlight! link TSText Fg
  highlight! link TSURI Blue

  " Markdown:
  " I like a subtle color for list markers, blue for link text and grey for URLs.
  highlight! link markdownListMarker Aqua
  highlight! link markdownOrderedListMarker Aqua
  highlight! link markdownLinkText Blue
  highlight! link markdownUrl DarkerGrey

  " NvimTree:
  " I find the default background color used in the NvimTree window (bg_dim) too
  " dark. Everforest does not define another color between bg_dim and bg0 (the
  " regular window background), so we'll use an intermediate color from
  "   https://www.colorhexa.com/1e2326-to-272e33
  let my_bg_dim = ['#22282c', '234']
  call everforest#highlight('NvimTreeNormal', l:palette.fg, my_bg_dim)
  call everforest#highlight('NvimTreeEndOfBuffer', my_bg_dim, my_bg_dim)
  " Also, Everforest colours folders in green. This looks nice enough, but blue
  " feels more traditional.
  highlight! link NvimTreeFolderName Blue
  highlight! link NvimTreeEmptyFolderName Blue
  highlight! link NvimTreeOpenedFolderName Blue
  " Everforest also does nothing to highlight opened file;
  " I prefer Catppuccin's behaviour of using bold green.
  call everforest#highlight('NvimTreeOpenedFile', l:palette.green, l:palette.none, 'bold')

  " Many of the TreeSitter highlight groups are linked in such a way that
  " they aren't italicized, even if you've set `everforest_enable_italic`.
  highlight! link TSConditional Conditional
  highlight! link TSException Exception
  highlight! link TSFuncBuiltin GreenItalic
  highlight! link TSKeyword Keyword
  highlight! link TSRepeat Repeat

  " The default coloring for TreeSitter Note, Warning and Danger elements
  " uses bold black text against a colored background, which is very effective
  " at getting your attention, but also quite ugly.
  highlight! link TSNote BlueItalic
  highlight! link TSWarning YellowItalic
  highlight! link TSDanger RedItalic

  " Everforest customizes the match-up (`andymass/vim-matchup`) highlight groups,
  " setting them to underline matches. However, I think I prefer just linking
  " them to the `MatchParen` group (which is match-up's default behaviour).
  highlight! link MatchWord MatchParen
  highlight! link MatchWordCur MatchParen

  " I prefer to avoid red for rainbow brackets (`nvim-ts-rainbow`).
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
  autocmd User NvimTreeSetup call s:everforest_custom()
augroup END


" vim: et sw=2 ts=2 sts=2 fdm=marker
