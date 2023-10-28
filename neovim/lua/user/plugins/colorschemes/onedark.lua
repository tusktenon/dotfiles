-- A great Onedark scheme that uses red sparingly.
return {
  'navarasu/onedark.nvim',
  lazy = true,
  opts = {
    style = 'dark',
    code_style = {
      comments = 'none'
    },
    colors = {
      comment_grey = '#7a818e'
    },
    highlights = {
      -- I find the grey used for comments in Onedark themes too dark and hard to read
      Comment = {fg = '$comment_grey'},
      SpecialComment = {fg = '$comment_grey'},
      TSComment = {fg = '$comment_grey'},

      -- TreeSitter recognizes `{}` in Lua as constructors,
      -- which Onedark renders in bold yellow by default
      TSConstructor = {fg = '$light_grey', fmt = 'none'},

      -- Colors for `nvim-ts-rainbow`
      -- (you could also use `$light_grey` in here somewhere)
      rainbowcol1 = {fg = '$fg'},
      rainbowcol2 = {fg ='$blue'},
      rainbowcol3 = {fg = '$purple'},
      rainbowcol4 = {fg = '$green'},
      rainbowcol5 = {fg = '$orange'},
      rainbowcol6 = {fg = '$cyan'},
      rainbowcol7 = {fg = '$yellow'},
    }
  }
}
