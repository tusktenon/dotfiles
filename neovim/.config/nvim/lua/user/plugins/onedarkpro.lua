require('onedarkpro').setup {
  dark_theme = 'onedark',  -- `onedark`, `onedark_vivid` or `onedark_dark`
  highlights = {
    -- I find the default comment color a bit dark
    Comment = { fg = '#707784'},

    -- Colors for `nvim-ts-rainbow`
    rainbowcol1 = {fg = '${fg}'},
    rainbowcol2 = {fg ='${blue}'},
    rainbowcol3 = {fg = '${purple}'},
    rainbowcol4 = {fg = '${green}'},
    rainbowcol5 = {fg = '${orange}'},
    rainbowcol6 = {fg = '${cyan}'},
    rainbowcol7 = {fg = '${yellow}'},
  },
  ft_highlights = {
    lua = {
      -- TreeSitter recognizes `{}` in Lua as constructors, which OneDarkPro renders in yellow.
      -- I'd rather color them like other brackets.
      TSConstructor = {link = 'TSPunctBracket'}
    }
  }
}
