return {
  'neanias/everforest-nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('everforest').setup {

      -- General Settings  {{{1
      background = 'medium',
      italics = true,
      disable_italic_comments = true,
      ui_contrast = 'low',
      dim_inactive_windows = false,
      diagnostic_text_highlight = false,
      diagnostic_virtual_text = 'coloured',
      diagnostic_line_highlight = true,
      float_style = 'bright',


      -- Highlight-group overrides  {{{1
      on_highlights = function(hl, palette)

        -- UI elements  {{{2

        -- Floating windows
        hl.FloatBorder = { link = 'Grey' }
        hl.NormalFloat = { link = 'Normal' }


        -- Languages  {{{2

        -- Default language elements
        hl.Todo = { fg = palette.blue, bg = palette.none, bold = true, italic = true }

        -- HTML
        hl.TSTag = { link = 'Aqua' }
        hl.TSText = { link = 'Fg' }
        hl.TSURI = { link = 'Blue' }

        -- Markdown
        hl.markdownListMarker = { link = 'Aqua' }
        hl.markdownOrderedListMarker = { link = 'Aqua' }
        hl.markdownLinkText = { link = 'Blue' }
        hl.markdownUrl = { fg = palette.grey0, bg = palette.none }


        -- Plugins  {{{2

        -- Match-up  {{{3
        -- Everforest highlights matching parentheses with a lighter background
        -- and matching words with underlines. If you prefer a more consistent
        -- look, you could link the `MatchWord` and `MatchWordCur` groups to
        -- `MatchParen` (which is match-up's default behaviour).

        -- NvimTree  {{{3
        -- Optional: "Transparent" background.
        hl.NvimTreeNormal = { link = 'Fg' }
        hl.NvimTreeEndOfBuffer = { link = 'Fg' }
        hl.NvimTreeCursorLine = { fg = palette.none, bg = palette.bg1 }
        -- Everforest colours folders in green. This looks nice enough, but
        -- blue feels more traditional.
        hl.NvimTreeFolderName = { link = 'Blue' }
        hl.NvimTreeEmptyFolderName = { link = 'Blue' }
        hl.NvimTreeOpenedFolderName = { link = 'Blue' }
        hl.NvimTreeFolderIcon = { link = 'Blue' }
        --  Unlike most color schemes, Everforest does nothing to highlight
        --  opened files. I like Catppuccin's use of bold green.
        hl.NvimTreeOpenedFile = { fg = palette.green, bg = palette.none, bold = true }
        -- The indent guides used for open folders are a little bright
        -- NOTE: You might also want to look at NvimTreeFolderArrowClosed and
        -- NvimTreeFolderArrowOpen
        hl.NvimTreeIndentMarker = { fg = palette.bg5, bg = palette.none }

        -- Rainbow-delimiters  {{{3
        -- I prefer to avoid red brackets (which I associate with a mismatch error).
        hl.RainbowDelimiterRed = { link = 'Fg' }

        -- ToggleTerm  {{{3
        hl.ToggleTerm1FloatBorder = { link = 'Grey' }

        -- Treesitter  {{{3
        -- Many of the Treesitter highlight groups aren't linked to their
        -- non-Treesitter equivalents, so they won't be italicized even if
        -- you've sest `italics = true`.
        hl.TSConditional = { link = 'Conditional' }
        hl.TSException = { link = 'Exception' }
        hl.TSFuncBuiltin = { link = 'GreenItalic' }
        hl.TSKeyword = { link = 'Keyword' }
        hl.TSRepeat = { link = 'Repeat' }
        -- The default coloring for TreeSitter Note, Warning and Danger elements
        -- uses bold black text against a colored background, which is very effective
        -- at getting your attention, but also quite ugly.
        hl.TSNote = { fg = palette.blue, bg = palette.none, bold = true, italic = true }
        hl.TSWarning = { link = 'YellowItalic' }
        hl.TSDanger = { link = 'RedItalic' }

        -- WhichKey  {{{3
        hl.WhichKey = { link = "Purple" }
        hl.WhichKeyDesc = { link = "Green" }
        hl.WhichKeyFloat = { link = 'Normal' }
        hl.WhichKeyGroup = { link = "Blue" }
        hl.WhichKeySeparator = { fg = palette.grey0, bg = palette.none }
        hl.WhichKeyValue = { link = 'Normal' }
      end
    }
    require('everforest').load()
  end
}

-- vim: et sw=2 ts=2 sts=2 fdm=marker
