return {
  'mrcjkb/haskell-tools.nvim',
  version = '^3',
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  config = function()
    vim.g.haskell_tools = {
      tools = {
        repl = {
          auto_focus = true,
        },
      },
    }
  end,
}
