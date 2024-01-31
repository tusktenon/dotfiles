local M = {}

-- Get the current working directory
M.cwd = function()
  local path = vim.fn.getcwd()
  local index = path:match'^.*()/'
  return path:sub(index + 1)
end

-- Use the Gitsigns plugin to get diff status
-- (https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-diff)
M.gitsigns_diff = function()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

return M
