-- Easily access Neovim terminals
-- TODO: Consider adding dedicated terminals for Calc, Haskell, Python, etc.
return {
  'akinsho/toggleterm.nvim',
  version = '*',
  keys = {
    {
      '<C-->',
      '<cmd>ToggleTerm direction=horizontal<cr>',
      mode = { 'n', 't' },
      desc = 'ToggleTerm split',
    },
    {
      '<C-=>',
      '<cmd>ToggleTerm direction=float<cr>',
      mode = { 'n', 't' },
      desc = 'ToggleTerm floating',
    },
    {
      '<leader>gg',
      '<cmd>lua _LazygitToggle()<CR>',
      mode = 'n',
      silent = true,
      desc = 'Lazygit',
    },
  },
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return math.max(15, vim.o.lines * 0.4)
        elseif term.direction == 'vertical' then
          return math.max(40, vim.o.columns * 0.4)
        end
      end,
      autochdir = true,
      highlights = {
        FloatBorder = { link = 'Fg' },
      },
      shade_terminals = false,
      shading_factor = '-10',
      float_opts = {
        border = 'curved',
      },
    }

    -- Custom terminal for Lazygit
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', direction = 'tab', hidden = true }
    function _LazygitToggle() lazygit:toggle() end
  end,
}
