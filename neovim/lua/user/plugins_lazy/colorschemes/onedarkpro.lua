-- Another great Onedark implementation. Compared to `navarasu/onedark.nvim`,
-- this scheme uses a lot more red by default, but also offers more
-- sophisticated customization options.
return {
  'olimorris/onedarkpro.nvim',
  lazy = true,
  config = function()
    -- I find the default gray (used, in particular, for comments) a bit too dark
    local LightGray =  '#707784'

    require('onedarkpro').setup {
      dark_theme = 'onedark',  -- `onedark`, `onedark_vivid` or `onedark_dark`
      highlights = {
        Comment = { fg = LightGray },

        TSTag = { fg = '${purple}' },
        TSTagDelimiter = { fg = LightGray },

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
  end
}
