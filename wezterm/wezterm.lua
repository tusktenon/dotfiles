local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'IBM Plex Mono'
config.font_size = 14
config.cell_width = 0.9
config.line_height = 1.1

config.color_scheme = 'Everforest Dark (Gogh)'

config.initial_cols = 120
config.initial_rows = 32

config.default_cwd = wezterm.home_dir .. '/Development'

config.keys = {
  {
    key = '-', -- raw:27
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = '=',
    mods = 'CTRL',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

return config
