-- Treesitter
return {
  'nvim-treesitter/nvim-treesitter',
  build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',  -- Syntax-aware text objects with select/move/swap/peek support
    'windwp/nvim-ts-autotag',                       -- Autopair functionality for HTLM/XML tags
    'JoosepAlviste/nvim-ts-context-commentstring',  -- Set `commentstring` based on cursor location
    'p00f/nvim-ts-rainbow',                         -- Rainbow brackets
  },
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = 'all',
      auto_install = true,
      ignore_install = {
        -- PHPDoc installation current fails on Apple Silicon
        -- (https://github.com/claytonrcarter/tree-sitter-phpdoc/issues/15)
        'phpdoc',
      },
      highlight = {
        enable = true,
        disable = {
          -- TreeSitter often gets confused by multiple inline code blocks on the same line
          'markdown',
        }
      },

      -- Extra Modules
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false  -- For integration with `Comment.nvim`
      },
      matchup = {
        enable = true,
        include_match_words = true,
      },
      rainbow = {
        enable = true,
        disable = {'html'},
        extended_mode = false,
        -- colors = {},
      },
      -- TODO: Try incremental selection
      -- TODO: Try indentation
      -- TODO: Set up text objects
    }
  end
}
