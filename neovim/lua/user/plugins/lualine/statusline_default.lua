local palette = require 'user.plugins.lualine.everforest_colours'
local utils = require 'user.plugins.lualine.utils'

-- It seems that the easiest way to get Lualine to display a static string is to wrap it in a function
local spacer = function() return ' ' end
local left_half_circle = function() return '' end
local lower_right_triangle = function() return '' end
local upper_left_triangle = function() return '' end
local folder_icon = function() return '' end
local position_icon = function() return '' end

local filetype_half_circle = function()
  if vim.bo.filetype == '' then return '' else return '' end
end

local sections = {}

sections.lualine_a = {
  'mode',
  { lower_right_triangle, color = { fg = palette.bg3 }, padding = 0 }
}

sections.lualine_b = {}

sections.lualine_c = {
  { upper_left_triangle, color = { bg = palette.bg2, fg = palette.bg3 }, padding = 0 },
  {
    'filetype',
    colored = false,
    icon_only = true,
    color = { bg = palette.bg2 },
  },
  {
    'filename',
    symbols = {
      modified = '●',      -- Text to show when the file is modified.
      readonly = '',      -- Text to show when the file is non-modifiable or readonly.
    },
    color = { bg = palette.bg2 },
  },
  { upper_left_triangle, color = { fg = palette.bg2 }, padding = { left = 0, right = 1 } },
  -- Use the Gitsigns plugin for branch and diff status
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
  { filetype_half_circle, color = { bg = palette.bg0, fg = palette.blue }, padding = { left = 1, right = 0 } },
  {
    'filetype',
    colored = false,
    icon_only = true,
    color = { bg = palette.blue, fg = palette.bg0 },
    padding = { left = 0, right = 1 }
  },
  {
    'filetype',
    icons_enabled = false,
    -- icon = { '', color = { bg = palette.blue, fg = palette.bg0 } },
    color = { bg = palette.bg2, fg = palette.blue },
  },
  { left_half_circle, color = { bg = palette.bg0, fg = palette.red }, padding = { left = 1, right = 0 } },
  { folder_icon, color = { bg = palette.red, fg = palette.bg0 }, padding = { left = 0, right = 1 } },
  { utils.cwd, color = { bg = palette.bg2 } },
  { left_half_circle, color = { bg = palette.bg0, fg = palette.aqua }, padding = { left = 1, right = 0 } },
  { position_icon, color = { bg = palette.aqua, fg = palette.bg0 }, padding = { left = 0, right = 1 } },
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
