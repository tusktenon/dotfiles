return {
  'neanias/everforest-nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('everforest').setup {
      background = 'medium',
      italics = true,
      disable_italic_comments = true,
      ui_contrast = 'low',
      diagnostic_text_highlight = false,
      diagnostic_virtual_text = 'coloured',
      diagnostic_line_highlight = true,
      float_style = 'bright',

      on_highlights = function(hl, palette)
        -- NvimTree:
        -- Optional: "Transparent" background.
        hl.NvimTreeNormal = { link = 'Fg' }
        hl.NvimTreeEndOfBuffer = { link = 'Fg' }
        hl.NvimTreeCursorLine = { fg = palette.none, bg = palette.bg1 }
        -- Everforest colours folders in green. This looks nice enough, but
        -- blue feels more traditional.
        hl.NvimTreeFolderName = { link = 'Blue' }
        hl.NvimTreeEmptyFolderName = { link = 'Blue' }
        hl.NvimTreeOpenedFolderName = { link = 'Blue' }
        --  Unlike most color schemes, Everforest does nothing to highlight
        --  opened files. I like Catppuccin's use of bold green.
        hl.NvimTreeOpenedFile = { fg = palette.green, bg = palette.none, bold = true }
        -- The indent guides used for open folders are a little bright
        -- NOTE: You might also want to look at NvimTreeFolderArrowClosed and
        -- NvimTreeFolderArrowOpen
        hl.NvimTreeIndentMarker = { fg = palette.bg5, bg = palette.none }
      end
    }
    require('everforest').load()
  end
}
