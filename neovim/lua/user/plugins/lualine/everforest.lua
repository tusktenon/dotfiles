local palette = require 'user.plugins.lualine.everforest_colours'

return {
  normal = {
    a = { bg = palette.blue, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.bg2, fg = palette.blue, gui = "bold" },
    c = { bg = palette.bgs, fg = palette.fg },
  },
  insert = {
    a = { bg = palette.green, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.bg2, fg = palette.green, gui = "bold" },
    c = { bg = palette.bgs, fg = palette.fg },
  },
  visual = {
    a = { bg = palette.purple, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.bg2, fg = palette.purple, gui = "bold" },
    c = { bg = palette.bgs, fg = palette.fg },
  },
  replace = {
    a = { bg = palette.red, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.bg2, fg = palette.red, gui = "bold" },
    c = { bg = palette.bgs, fg = palette.fg },
  },
  command = {
    a = { bg = palette.aqua, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.bg2, fg = palette.aqua, gui = "bold" },
    c = { bg = palette.bgs, fg = palette.fg },
  },
  terminal = {
    a = { bg = palette.yellow, fg = palette.bg0, gui = "bold" },
    b = { bg = palette.bg2, fg = palette.yellow, gui = "bold" },
    c = { bg = palette.bgs, fg = palette.fg },
  },
  inactive = {
    a = { bg = palette.bgs, fg = palette.grey1 },
    b = { bg = palette.bgs, fg = palette.grey1 },
    c = { bg = palette.bgs, fg = palette.grey1 },
  },
}
