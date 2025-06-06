-- Lualine: customize the statusline, tabline and winbar

local color_theme = require 'user.plugins.lualine.everforest'

-- local statusline_style = require 'user.plugins.lualine.statusline_blocks'
local statusline_style = require 'user.plugins.lualine.statusline_hybrid1'
-- local statusline_style = require 'user.plugins.lualine.statusline_hybrid2'
-- local statusline_style = require 'user.plugins.lualine.statusline_hybrid3'
-- local statusline_style = require 'user.plugins.lualine.statusline_nvcd'

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = color_theme,
        globalstatus = true,
        section_separators = '',
        component_separators = '',
      },

      sections = statusline_style,

      tabline = {
        lualine_a = {},
        lualine_b = {
          {
            'buffers',
            max_length = vim.o.columns - 4,
            filetype_names = {
              lazy = 'Lazy',
              mason = 'Mason',
              NvimTree = 'FileTree',
            },
            use_mode_colors = true,
            symbols = { alternate_file = '# '},
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          { 'tabs', use_mode_colors = true }
        }
      },

      extensions = {'lazy', 'man', 'mason', 'nvim-tree', 'toggleterm'}
    }
  end
}
