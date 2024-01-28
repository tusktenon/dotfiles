-- Various plugins that don't fit neatly into other categories

return {
  -- Close several buffers at once; close buffers while preserving windows
  {
    'kazhala/close-buffers.nvim',
    config = function()
      require('close_buffers').setup {
        -- Types of deletion that should preserve window layout:
        preserve_window_layout = { 'this', 'nameless' }
      }
    end
  },

  -- Color highlighting
  {
    'NvChad/nvim-colorizer.lua',
    keys = {
      { '<leader>tc', '<cmd>ColorizerToggle<CR>', desc = 'Highlight colors' },
    },
    opts = {
      user_default_options = {
        RGB = true,     -- #RGB hex codes
        RRGGBB = true,  -- #RRGGBB hex codes
        names = false,  -- Named colors
        rgb_fn = true,  -- rgb() and rgba()
        hsl_fn = true,  -- hsl() and hsla()
      }
    }
  },

  -- Diff Visual selections
  'AndrewRadev/linediff.vim',

  -- Open Markdown files in Marked
  'itspriddle/vim-marked',

  -- Maximimize and restore the current window
  {
    'szw/vim-maximizer',
    event = 'WinEnter',
    keys = {
      { '<leader>wm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize (toggle)' },
      { '<leader>tm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize window' },
    },
  },

  -- Project Management
  --  * Automatically `cd` to project directory
  --  * Access recent projects from Telescope
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        -- Don't calculate root for specific directories
        exclude_dirs = {'~/Development/dotfiles/neovim/.config/*'}
      }
    end
  }
}
