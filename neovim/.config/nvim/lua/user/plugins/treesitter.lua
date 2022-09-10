require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  auto_install = true,
  -- PHPDoc installation current fails on Apple Silicon
  -- (https://github.com/claytonrcarter/tree-sitter-phpdoc/issues/15)
  ignore_install = {'phpdoc'},
  highlight = {
    enable = true,
    disable = {}
  },

  -- Extra Modules
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false  -- For integration with `Comment.nvim`
  },
  rainbow = {
    enable = true,
    -- disable = {},
    extended_mode = false,
    -- colors = {},
  },
  -- TODO: Try incremental selection
  -- TODO: Try indentation
}
