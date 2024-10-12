-- Various plugins that don't fit neatly into other categories

return {
  -- Close several buffers at once; close buffers while preserving windows
  {
    'kazhala/close-buffers.nvim',
    config = function()
      require('close_buffers').setup {
        -- Types of deletion that should preserve window layout:
        preserve_window_layout = { 'this', 'nameless' },
      }
    end,
  },

  -- Color highlighting
  {
    'NvChad/nvim-colorizer.lua',
    keys = {
      { '<leader>tc', '<cmd>ColorizerToggle<CR>', desc = 'Highlight colors' },
    },
    opts = {
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- Named colors
        rgb_fn = true, -- rgb() and rgba()
        hsl_fn = true, -- hsl() and hsla()
      },
    },
  },

  -- Diff Visual selections
  {
    'AndrewRadev/linediff.vim',
    cmd = 'Linediff',
  },

  -- Open Markdown files in Marked
  {
    'itspriddle/vim-marked',
    ft = 'markdown',
  },

  -- Maximize and restore the current window
  {
    'szw/vim-maximizer',
    keys = {
      { '<leader>wm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize (toggle)' },
      { '<leader>tm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize window' },
    },
  },

  -- Configure the Lua language server for editing your Neovim config
  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on Lua files
  },

  -- Project Management
  --  * Automatically `cd` to project directory
  --  * Access recent projects from Telescope
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        -- Don't calculate root for specific directories
        exclude_dirs = { '~/Development/dotfiles/neovim/.config/*' },
      }
    end,
  },

  -- An improved list interface for diagnostics, reference, quickfix and loclist
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
    config = function()
      require('trouble').setup {
        use_diagnostic_signs = true, -- Use the signs defined in your LSP config
      }

      -- In file buffers, I prefer to highlight only the current line number
      -- (that is, I've set `vim.opt.cursorlineopt = 'number'`). However, I do
      -- want to highlight the current line in the Trouble window.
      vim.api.nvim_create_autocmd('WinEnter', {
        pattern = 'Trouble',
        callback = function() vim.opt.cursorlineopt = 'line' end,
      })
    end,
  },
}
