-- Plugins to improve appearance

return {
  -- Column guides: use a character for the colorcolumn
  {
    'lukas-reineke/virt-column.nvim',
    config = function()
      -- `virt-column` either needs to be loaded after your colorscheme (and possibly lualine?),
      -- or you can run `highlight clear ColorColumn` after the color scheme has loaded
      -- (see https://github.com/lukas-reineke/virt-column.nvim/issues/2)
      vim.api.nvim_create_autocmd('ColorScheme', {
        command = 'highlight clear ColorColumn'
      })

      require('virt-column').setup {
        char = '│',  -- Default is '┃'; indent_blankline_char default is '│'
        exclude = { filetypes = {'toggleterm'} }
      }
    end
  },

  -- Indent guides
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '▏' },
      scope = {
        -- Don't underline the first and last lines of the current scope
        show_start = false,
        show_end = false,
      },
    },
  },

  -- Illuminate: Highlight other occurrences of word under cursor
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure {
        filetypes_denylist = {  -- Filetypes not to illuminate
          'markdown', 'text'
        },
        under_cursor = false  -- Don't illuminate under cursor 
      }
    end
  },

  -- Rainbow brackets
  {
    'hiphish/rainbow-delimiters.nvim',
    enabled = false,
    config = function()
      require('rainbow-delimiters.setup').setup {
        highlight = {
          -- Re-use the highlight group names from the p00f/nvim-ts-rainbow plugin,
          -- so any color-scheme customizations continue to work.
          'rainbowcol1',
          'rainbowcol2',
          'rainbowcol3',
          'rainbowcol4',
          'rainbowcol5',
          'rainbowcol6',
          'rainbowcol7',
        }
      }
    end
  },

  -- Improve the default vim.ui interfaces (compare LSPSaga, Noice)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- Filetype icons for use by other plugins (lualine, nvim-tree, Trouble)
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    opts = {
      override = {
        rust = { icon = '' }  -- options:  󱘗 
      },
      override_by_extension = {
        ["rs"] = { icon = '' }
      }
    }
  }
}
