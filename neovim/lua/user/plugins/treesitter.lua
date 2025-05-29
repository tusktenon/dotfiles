-- Treesitter
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update { with_sync = true } end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects', -- Syntax-aware text objects with select/move/swap/peek support
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'cmake',
          'comment',
          'cpp',
          'css',
          'gitcommit',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'gowork',
          'html',
          'http',
          'java',
          'javascript', -- and JSX
          'json',
          'latex',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'python',
          'query',
          'rust',
          'sql',
          'toml',
          'typescript', -- and TSX
          'vim',
          'vimdoc',
          'xml',
          'yaml',
        },
        auto_install = true,
        highlight = {
          enable = true,
          disable = {
            -- TreeSitter often gets confused by multiple inline code blocks on the same line
            'markdown',
          },
        },
        incremental_selection = { -- Compare the vim-expand-region plugin
          enable = true,
          keymaps = {
            init_selection = '<C-Space>',
            node_incremental = '<C-Space>',
            scope_incremental = false,
            node_decremental = '<BS>',
          },
        },
        indent = { enable = true },

        -- Extra Modules
        matchup = {
          enable = true,
          include_match_words = true,
        },
        -- rainbow = {
        --   enable = true,
        --   disable = {'html'},
        --   extended_mode = false,
        --   -- colors = {},
        -- },
      }
    end,
  },

  -- Autopair functionality for HTML/XML tags (including JSX, TSX, etc.)
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },
}
