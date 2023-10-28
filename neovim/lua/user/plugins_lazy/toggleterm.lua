-- Terminal management
-- TODO: Consider adding dedicated terminals for Calc, Haskell, Python, etc.
return {
  "akinsho/toggleterm.nvim",
  version = '*',
  opts = {
    size = 20,
    open_mapping = [[<C-\>]],
    direction = 'horizontal',
    shade_terminals = true,
    shading_factor = '-10',
  }
}
