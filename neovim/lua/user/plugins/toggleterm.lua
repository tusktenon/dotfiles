-- Easily access Neovim terminals
-- TODO: Consider adding dedicated terminals for Calc, Haskell, Python, etc.
return {
  "akinsho/toggleterm.nvim",
  version = '*',
  keys = {
    { '<C-->', "<cmd>ToggleTerm direction=horizontal<cr>", mode = {'n', 't'}, desc = "ToggleTerm split" },
    { '<C-=>', "<cmd>ToggleTerm direction=float<cr>", mode = {'n', 't'}, desc = "ToggleTerm floating" },
  },
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return math.max(15, vim.o.lines * 0.4)
      elseif term.direction == 'vertical' then
        return math.max(40, vim.o.columns * 0.4)
      end
    end,
    highlights = {
      FloatBorder = {
        link = 'Grey'
      }
    },
    shade_terminals = false,
    shading_factor = '-10',
    float_opts = {
      border = 'curved',
    }
  }
}
