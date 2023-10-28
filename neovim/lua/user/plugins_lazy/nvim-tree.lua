-- Tree-style file explorer (netrw replacement)
return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  config = function()
    local function on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- Custom mappings
      vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    end

    require('nvim-tree').setup {
      on_attach = on_attach,

      diagnostics = {
        enable = true,
        icons = { error = 'E', warning = 'W', hint = 'H', info = 'I' }
      },

      renderer = {
        highlight_opened_files = 'all',
        indent_markers = { enable = true },
        icons = {
          git_placement = 'after',
          show = { file = false, folder = false }
        }
      },

      -- Settings for integration with `ahmedkhalf/project.nvim`:
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true
      }
    }
  end
}
