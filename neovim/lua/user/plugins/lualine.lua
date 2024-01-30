-- Lualine: customize the statusline, tabline and winbar

-- Get the current working directory
local cwd = function()
  local path = vim.fn.getcwd()
  local index = path:match'^.*()/'
  return path:sub(index + 1)
end

return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        globalstatus = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'branch', 'diff'},
        lualine_x = {'diagnostics'},
        lualine_y = {'filetype', cwd},
        lualine_z = {'location'}
      },
      extensions = {'lazy', 'man', 'mason', 'nvim-tree', 'toggleterm'}
    }
  end
}
