-- A really nice One Dark scheme ported from Doom Emacs.
-- Avoids much use of red by instead having two shades of purple.
return {
  'NTBBloodbath/doom-one.nvim',
  lazy = true,
  init = function()
    local g = vim.g

    g.doom_one_cursor_coloring = false         -- Add color to cursor
    g.doom_one_terminal_colors = true          -- Set `:terminal` colors
    g.doom_one_italic_comments = false         -- Enable italic comments
    g.doom_one_enable_treesitter = true        -- Enable TS support
    g.doom_one_diagnostics_text_color = true  -- Color whole diagnostic text or only underline
    g.doom_one_transparent_background = false  -- Enable transparent background

    -- Pumblend transparency
    g.doom_one_pumblend_enable = false
    g.doom_one_pumblend_transparency = 20

    -- Plugin integrations
    g.doom_one_plugin_barbar = false
    g.doom_one_plugin_dashboard = false
    g.doom_one_plugin_vim_illuminate = true
    g.doom_one_plugin_indent_blankline = true
    g.doom_one_plugin_lspsaga = false
    g.doom_one_plugin_neogit = true
    g.doom_one_plugin_neorg = false
    g.doom_one_plugin_nvim_tree = true
    g.doom_one_plugin_startify = false
    g.doom_one_plugin_telescope = true
    g.doom_one_plugin_whichkey = true
  end
}
