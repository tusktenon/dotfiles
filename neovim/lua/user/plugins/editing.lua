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
  -- {
  --   'wellle/targets.vim',
  --   config = function()
  --     -- Seek for next and last (previous) object with `n` and `p`
  --     vim.g.targets_nl = {'n', 'p'}
  --
  --     -- Prefer multiline targets around cursor over distant targets within cursor line
  --     -- (this is more consistent with default Vim behaviour)
  --     vim.g.targets_seekRanges = 'cc cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'
  --   end
  -- },

  -- Text Objects
  {
    -- A plugin that lets you create your own text objects
    'kana/vim-textobj-user',
    dependencies = {
      {
        -- Redefines 'ab' and 'ib' for any type of brace: (, [, {, <
        -- NOTE: targets.vim also provides this funcitonality
        'rhysd/vim-textobj-anyblock',
        config = function()
          vim.g['textobj#anyblock#blocks'] = { '(', '[', '{', '<' }
        end
      },
      -- Adds 'ae' and 'ie' for the entire buffer
      'kana/vim-textobj-entire',

      -- Adds 'aq' and 'iq' for any pair of quotes of any type (single, double or backtick)
      -- NOTE: targets.vim also provides this funcitonality
      'beloglazov/vim-textobj-quotes',

      -- Adds 'ax' and 'ix' for HTML/XML attribute
      'whatyouhide/vim-textobj-xmlattr',
    }
  },

  -- Adds 'aI', 'ai' and 'ii' for indentation level
  'michaeljsmith/vim-indent-object'
}
