require('nvim-tree').setup {
  diagnostics = {
    enable = true,
    icons = { error = '●', warning = '●', hint = '●', info = '●' }
  },

  renderer = {
    highlight_opened_files = 'all',
    indent_markers = { enable = true },
    icons = {
      git_placement = 'after',
      show = { file = false, folder = false }
    }
  },

  view = {
    mappings = {
      list = {
        { key = 'h', action = 'close_node' },
        { key = 'l', action = 'edit' },
        { key = 'v', action = 'vsplit' },
      }
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
