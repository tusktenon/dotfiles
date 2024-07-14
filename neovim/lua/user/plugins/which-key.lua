return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    icons = {
      separator = '→',
      rules = false,
    },
    win = {
      border = { '─', '─', '─', '', '', '', '', '' }, -- top only
    },
    replace = {
      key = { { '<Space>', 'SPC' } },
    },
    spec = {
      { '<leader>b', group = 'Buffers' },
      { '<leader>c', group = 'Code' },
      { '<leader>f', group = 'Files/Find' },
      { '<leader>g', group = 'Git' },
      { '<leader>l', group = 'Language' },
      { '<leader>lw', group = 'Workspace' },
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>w', group = 'Windows' },
      { '<leader>x', group = 'Trouble/swap' },
      { 'gJ', desc = 'Join into single-line form' },
      { 'gS', desc = 'Split into multi-line form' },
      { 'ys', desc = 'Add surround pair' },
      { 'yss', desc = 'Add surround pair around line' },
    },
  },
}
