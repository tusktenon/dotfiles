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
      ensure_installed = {
        'bash',
        'c',
        'cmake',
        'comment',
        'cpp',
        'css',
        'gitignore',
        'haskell',
        'html',
        'java',
        'javascript',
        'json',
        'latex',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'php',
        'python',
        'racket',
        'ruby',
        'rust',
        'sql',
        'toml',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
        'query',
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = {
          -- TreeSitter often gets confused by multiple inline code blocks on the same line
          'markdown',
        }
      },
      incremental_selection = {  -- Compare the vim-expand-region plugin
        enable = true,
        keymaps = {
          init_selection = '<C-Space>',
          node_incremental = '<C-Space>',
          scope_incremental = false,
          node_decremental = '<BS>',
        }
      },
      indent = { enable = true },

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
      -- TODO: Set up text objects
    }
  end
}
