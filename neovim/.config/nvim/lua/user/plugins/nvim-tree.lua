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
  }
}
