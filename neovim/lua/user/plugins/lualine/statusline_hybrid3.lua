-- A blend of the NvChad "default" and "minimal" statusline themes.
-- The section shapes from my "blocks" theme, with some colors (for mode and
-- filename) from my "nvcd" theme.

local palette = require 'user.plugins.lualine.everforest_colours'
local utils = require 'user.plugins.lualine.utils'

-- It seems that the easiest way to get Lualine to display a static string is to wrap it in a function
local spacer = function() return ' ' end
local folder_icon = function() return '' end
local position_icon = function() return '' end

local filetype_spacer = function()
  if vim.bo.filetype == '' then return '' else return ' ' end
end

local sections = {}

sections.lualine_a = { 'mode' }

sections.lualine_b = {}

sections.lualine_c = {
  { spacer, color = { bg = palette.bg0 }, padding = 0 },
  {
    'filetype',
    colored = false,
    icon_only = true,
    color = { bg = palette.bg3 },
  },
  {
    'filename',
    symbols = {
      modified = '●',      -- Text to show when the file is modified.
      readonly = '',      -- Text to show when the file is non-modifiable or readonly.
    },
    color = { bg = palette.bg3 },
  },
  { spacer, color = { bg = palette.bg0 }, padding = 0 },
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
  { filetype_spacer, color = { bg = palette.bg0 }, padding = 0 },
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
  { spacer, color = { bg = palette.bg0 }, padding = 0 },
  { folder_icon, color = { bg = palette.red, fg = palette.bg0 } },
  { utils.cwd, color = { bg = palette.bg2 } },
  { spacer, color = { bg = palette.bg0 }, padding = 0 },
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
