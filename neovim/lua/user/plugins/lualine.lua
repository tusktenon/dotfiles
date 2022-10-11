require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    -- disabled_filetypes = {
    --   winbar = {'NvimTree'},
    -- },
    globalstatus = true,
  },
  -- winbar = {
  --   lualine_z = {'filename'}
  -- },
  -- inactive_winbar = {
  --   lualine_z = {'filename'}
  -- },
  extensions = {'nvim-tree'}
}
