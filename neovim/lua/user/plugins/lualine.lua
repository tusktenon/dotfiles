-- Lualine: customize the statusline, tabline and winbar

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
        theme = 'auto',
        globalstatus = true,
      },

      sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {
          -- Use the Gitsigns plugin for branch and diff status
          { 'b:gitsigns_head', icon = '' },
          { 'diff', source = gitsigns_diff },
        },
        lualine_x = {'diagnostics'},
        lualine_y = {'filetype', cwd},
        lualine_z = {'location'}
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
