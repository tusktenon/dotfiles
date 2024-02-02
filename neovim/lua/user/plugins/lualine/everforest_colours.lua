local config = require('everforest').config
local background = config.background or 'medium'
local theme = vim.o.background

local palette = {}

if theme == 'dark' then
  palette.fg = '#d3c6aa'
  palette.red = '#e67e80'
  palette.orange = '#e69875'
  palette.yellow = '#dbbc7f'
  palette.green = '#a7c080'
  palette.aqua = '#83c092'
  palette.blue = '#7fbbb3'
  palette.purple = '#d699b6'
  palette.grey0 = '#7a8478'
  palette.grey1 = '#859289'
  palette.grey2 = '#9da9a0'

  if background == 'medium' then
    palette.bg0 = '#2d353b'
    palette.bg1 = '#343f44'
    palette.bg2 = '#3d484d'
    palette.bg3 = '#475258'
    palette.bg4 = '#4f585e'
    palette.bg5 = '#56635f'
    -- palette.bgs = '#313a3f'
    palette.bgs = '#343f44'
  end
end

return palette
