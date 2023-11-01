-- Assorted plugins to enhance text editing

return {
  -- A text-exchange operator
  'tommcdo/vim-exchange',

  -- Enhanced `matchit` and `matchparen`
  'andymass/vim-matchup',

  -- Switch between single- and multi-line code forms
  'AndrewRadev/splitjoin.vim',

  -- Surround: add/change/delete delimiter pairs (c.f. tpope/vim-surround)
  {
    'kylechui/nvim-surround',
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = true
  },

  -- Recognize CamelCase and snake_case words
  'chaoren/vim-wordmotion',

  -- Adds various text objects
  {
    'wellle/targets.vim',
    config = function()
      -- Prefer multiline targets around cursor over distant targets within cursor line
      -- (this is more consistent with default Vim behaviour)
      vim.g.targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'
    end
  },

  -- Text Objects
  {
    'kana/vim-textobj-entire',           -- Entire buffer
    dependencies = {'kana/vim-textobj-user'}
  },
  'michaeljsmith/vim-indent-object',     -- Indentation level
  {
    'whatyouhide/vim-textobj-xmlattr',   -- HTML/XML attribute
    dependencies = {'kana/vim-textobj-user'}
  }
}
