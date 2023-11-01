return {
  'hiphish/rainbow-delimiters.nvim',
  enabled = false,
  config = function()
    require('rainbow-delimiters.setup').setup {
      highlight = {
        -- Re-use the highlight group names from the p00f/nvim-ts-rainbow plugin,
        -- so any color-scheme customizations continue to work.
        'rainbowcol1',
        'rainbowcol2',
        'rainbowcol3',
        'rainbowcol4',
        'rainbowcol5',
        'rainbowcol6',
        'rainbowcol7',
      }
    }
  end
}
