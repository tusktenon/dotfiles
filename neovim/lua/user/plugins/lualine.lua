-- Lualine: customize the statusline, tabline and winbar

local color_theme = require 'user.plugins.lualine.everforest'
local statusline_style = require 'user.plugins.lualine.statusline_default'

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
        lualine_b = { { 'buffers', symbols = { alternate_file = '# '}, }, },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
      },

      extensions = {'lazy', 'man', 'mason', 'nvim-tree', 'toggleterm'}
    }
  end
}
