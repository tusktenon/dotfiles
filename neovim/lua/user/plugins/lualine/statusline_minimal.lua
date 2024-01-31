local palette = require 'user.plugins.lualine.everforest_colours'
local utils = require 'user.plugins.lualine.utils'

-- It seems that the easiest way to get Lualine to display a static string is to wrap it in a function
local spacer = function() return ' ' end
local mode_icon = function() return '' end
local folder_icon = function() return '' end
local position_icon = function() return '' end

local sections = {}

sections.lualine_a = { mode_icon }
sections.lualine_b = { 'mode' }

sections.lualine_c = {
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
    source = utils.gitsigns_diff,
    color = {gui = 'bold'},
    padding = 0,
  },
}

sections.lualine_x = {
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
  { utils.cwd, color = { bg = palette.bg2 } },
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
}

sections.lualine_y = {}
sections.lualine_z = {}

return sections
