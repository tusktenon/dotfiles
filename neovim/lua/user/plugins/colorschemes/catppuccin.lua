-- The `frappe` flavour is a pleasant, pastel take on Palenight.
return {
  'catppuccin/nvim',
  name = "catppuccin",
  lazy = true,
  config = function()
    vim.g.catppuccin_flavour = 'frappe'  -- frappe, macchiato or mocha
    local colors = require('catppuccin.palettes').get_palette()

    require('catppuccin').setup {
      -- Styling of general highlight groups
      styles = {
        -- booleans = {},
        comments = {},
        -- conditionals = {},
        -- functions = {},
        -- keywords = {},
        -- loops = {},
        -- numbers = {},
        -- operators = {},
        -- properties = {},
        -- strings = {},
        -- types = {},
        -- variables = {},
      },

      -- Plugin support
      integrations = {
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false
        },
        native_lsp = {
          enabled = true,
        },
        neogit = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        -- ts_rainbow = true,  -- Use your own settings instead
        which_key = true,
      },

      -- Highlight group overrides
      highlight_overrides = {
        all = {
          --TreeSitter
          TSTitle = { fg = colors.text, style = {'bold'} },
          TSURI = { fg = colors.blue, style = {} },

          -- Colors for `nvim-ts-rainbow`
          rainbowcol1 = { fg = colors.teal },
          rainbowcol2 = { fg = colors.yellow },
          rainbowcol3 = { fg = colors.blue },
          rainbowcol4 = { fg = colors.pink },
          rainbowcol6 = { fg = colors.green },
          rainbowcol5 = { fg = colors.flamingo },
          rainbowcol7 = { fg = colors.lavender },
        },
        frappe = {
          Comment = { fg = colors.overlay2 }
        }
      },

      -- Color overrides
      color_overrides = {},
    }
  end
}
