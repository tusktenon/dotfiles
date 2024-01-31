local palette = require 'user.plugins.lualine.everforest_colours'
local utils = require 'user.plugins.lualine.utils'

local sections = {}

sections.lualine_a = { utils.mode_icon }
sections.lualine_b = { 'mode' }

sections.lualine_c = {
  { utils.spacer, padding = 0 },
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
  { utils.spacer, padding = 0 },
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
  { utils.spacer, padding = 0 },
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
  { utils.spacer, padding = 0 },
  { utils.folder_icon, color = { bg = palette.red, fg = palette.bg0 } },
  { utils.cwd, color = { bg = palette.bg2 } },
  { utils.spacer, padding = 0 },
  { utils.position_icon, color = { bg = palette.aqua, fg = palette.bg0 } },
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
