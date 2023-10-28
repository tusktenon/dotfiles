-- Illuminate: Highlight other occurrences of word under cursor
return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure {
      filetypes_denylist = {  -- Filetypes not to illuminate
        'markdown', 'text'
      },
      under_cursor = false  -- Don't illuminate under cursor 
    }
  end
}
