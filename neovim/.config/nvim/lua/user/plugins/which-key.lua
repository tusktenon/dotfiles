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
  ['<leader>'] = {
    b = { name = '+Buffers' },
    c = { name = '+Code' },
    f = { name = '+Files/Find' },
    g = { name = '+Git' },
    l = { name = '+Language' },
    s = { name = '+Search' },
    w = { name = '+Windows' },
  }
}
