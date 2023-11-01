-- Status Line
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local lazy_status = require 'lazy.status'  -- To show Lazy pending updates count
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        globalstatus = true,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          'encoding', 'fileformat', 'filetype'  -- Default components
        },
      },
      extensions = {'lazy', 'man', 'mason', 'nvim-tree', 'toggleterm'}
    }
  end
}
