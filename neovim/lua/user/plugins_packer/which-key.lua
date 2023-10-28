local whichkey = require 'which-key'

whichkey.setup {
  key_labels = {
    -- Override the label used to display specific keys
    ['<leader>'] = 'SPC',
    ['<space>'] = 'SPC',
    ['<cr>'] = 'RET',
    ['<tab>'] = 'TAB',
  },
  window = {
    border = 'rounded'
  }
}

whichkey.register {
  ['g'] = {
    J = 'Join into single-line form',
    S = 'Split into multi-line form'
  },
  ['<leader>'] = {
    b = { name = '+Buffers' },
    c = { name = '+Code' },
    f = { name = '+Files/Find' },
    g = { name = '+Git' },
    l = { name = '+Language' },
    lw = { name = '+Workspace' },
    s = { name = '+Search' },
    w = { name = '+Windows' },
  }
}
