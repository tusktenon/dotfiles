-- Lualine: customize the statusline, tabline and winbar

local custom_everforest = require 'user.plugins.lualine.everforest'
local palette = require 'user.plugins.lualine.everforest_colours'

-- It seems that the easiest way to get Lualine to display a static string is to wrap it in a function
local spacer = function() return ' ' end
local mode_icon = function() return '' end
local folder_icon = function() return '' end
local position_icon = function() return '' end

-- Get the current working directory
local cwd = function()
  local path = vim.fn.getcwd()
  local index = path:match'^.*()/'
  return path:sub(index + 1)
end

-- Use the Gitsigns plugin to get diff status
-- (https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-diff)
local gitsigns_diff = function()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = custom_everforest,
        globalstatus = true,
        section_separators = '',
        component_separators = '',
      },

      sections = {
        lualine_a = { mode_icon },
        lualine_b = { 'mode' },
        lualine_c = {
          { spacer, padding = 0 },
          {
            'filetype',
            colored = false,
            icon_only = true,
            color = { bg = palette.fg, fg = palette.bg0 },
          },
          {
            'filename',
            symbols = {
              modified = '●',      -- Text to show when the file is modified.
              readonly = '',      -- Text to show when the file is non-modifiable or readonly.
            },
            color = { bg = palette.bg2 },
          },
          -- Use the Gitsigns plugin for branch and diff status
          { spacer, padding = 0 },
          {
            'b:gitsigns_head',
            icon = '',
            color = {gui = 'bold'},
          },
          {
            'diff',
            colored = false,
            symbols = {added = ' ', modified = ' ', removed = ' '},
            source = gitsigns_diff,
            color = {gui = 'bold'},
            padding = 0,
          },
        },
        lualine_x = {
          {
            'diagnostics',
            symbols = {error = ' ', warn = ' ', info = ' ', hint = '󰛩 '},
          },
          { spacer, padding = 0 },
          {
            'filetype',
            colored = false,
            icon_only = true,
            color = { bg = palette.blue, fg = palette.bg0 },
          },
          {
            'filetype',
            icons_enabled = false,
            -- icon = { '', color = { bg = palette.blue, fg = palette.bg0 } },
            color = { bg = palette.bg2, fg = palette.blue },
          },
          { spacer, padding = 0 },
          { folder_icon, color = { bg = palette.red, fg = palette.bg0 } },
          { cwd, color = { bg = palette.bg2 } },
          { spacer, padding = 0 },
          { position_icon, color = { bg = palette.aqua, fg = palette.bg0 } },
          {
            'progress',
            color = { bg = palette.bg2, fg = palette.aqua },
            -- padding = { left = 1, right = 0 },
          },
          {
            'location',
            color = { bg = palette.bg2, fg = palette.aqua },
            padding = { left = 0, right = 1 },
          },
        },
        lualine_y = {},
        lualine_z = {}
      },

      tabline = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
      },

      extensions = {'lazy', 'man', 'mason', 'nvim-tree', 'toggleterm'}
    }
  end
}
