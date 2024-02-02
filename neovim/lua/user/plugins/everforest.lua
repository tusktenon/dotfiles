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

        -- Window/split separators
        hl.VertSplit = { fg = palette.bg2, bg = palette.none }

        -- Floating windows
        hl.NormalFloat = { link = 'Normal' }
        hl.FloatBorder = { link = 'VertSplit' }
        hl.FloatTitle = { fg = palette.bg0, bg = palette.blue, bold = true }


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


        -- NvimTree  {{{2

        -- The default combination of a darker background and window/split lines
        -- looks really ugly. There are two possible fixes.
        -- Option 1: "Transparent" background.
        hl.NvimTreeNormal = { link = 'Fg' }
        hl.NvimTreeEndOfBuffer = { link = 'Fg' }
        hl.NvimTreeCursorLine = { fg = palette.none, bg = palette.bg1 }

        -- Option 2: "Transparent" separator (see NvChad).
        -- You'll also need to adjust your `fillchar` settings to avoid ugly glitches
        -- when you open splits with nvim-tree open.
        -- hl.NvimTreeWinSeparator = { fg = palette.bg0 }
        -- hl.NvimTreeCursorLine = { bg = palette.bg1 }

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


        -- Other Plugins  {{{2

        -- Match-up  {{{3
        -- Everforest highlights matching parentheses with a lighter background
        -- and matching words with underlines. If you prefer a more consistent
        -- look, you could link the `MatchWord` and `MatchWordCur` groups to
        -- `MatchParen` (which is match-up's default behaviour).

        -- nvim-cmp  {{{3
        -- Fix for wildmenu view.
        -- For some reason, the `PmenuSel` highlight group does not update the foreground setting from 
        -- the `CmpItemAbbrMatch` and `CmpItemAbbrMatchFuzzy` groups, resulting in invisible characters.
        -- Note that this is only an issue for the `wildmenu` view; the default `custom` menu works fine.
        -- hl.PmenuSel = { fg = palette.bg0, bg = palette.statusline1, bold = true }
        -- Option 1:
        -- hl.PmenuSel = { fg = palette.none, bg = palette.bg4, bold = true }
        -- Option 2:
        hl.PmenuSel = { fg = palette.bg0, bg = palette.statusline1, bold = true }
        hl.CmpItemAbbrMatch = { fg = palette.none, bg = palette.none, bold = true }
        hl.CmpItemAbbrMatchFuzzy = { fg = palette.none, bg = palette.none, bold = true }

        -- Rainbow-delimiters  {{{3
        -- I prefer to avoid red brackets (which I associate with a mismatch error).
        hl.RainbowDelimiterRed = { link = 'Fg' }

        -- Telescope  {{{3
        hl.TelescopeBorder = { link = 'FloatBorder'}
        hl.TelescopeTitle = { link = 'FloatTitle' }
        hl.TelescopePromptTitle = { fg = palette.bg0, bg = palette.yellow, bold = true }
        hl.TelescopePromptPrefix = { link = 'Yellow' }
        hl.TelescopePromptCounter = { fg = palette.bg5, bg = palette.bg0 }
        hl.TelescopePreviewTitle = { fg = palette.bg0, bg = palette.blue, bold = true }
        hl.TelescopeResultsTitle = { fg = palette.bg0, bg = palette.purple, bold = true }

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
        hl.WhichKeyFloat = { link = 'Normal' }
        hl.WhichKeyValue = { link = 'WhichKeyFloat' }
        hl.WhichKey = { link = "Purple" }
        hl.WhichKeySeparator = { fg = palette.grey0, bg = palette.none }
        hl.WhichKeyDesc = { link = "Green" }
        hl.WhichKeyGroup = { link = "Blue" }
      end
    }
    require('everforest').load()
  end
}

-- vim: et sw=2 ts=2 sts=2 fdm=marker
