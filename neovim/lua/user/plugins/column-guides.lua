-- Column guides: use a character for the colorcolumn
return {
  'lukas-reineke/virt-column.nvim',
  config = function()
    -- `virt-column` either needs to be loaded after your colorscheme (and possibly lualine?),
    -- or you can run `highlight clear ColorColumn` after the color scheme has loaded
    -- (see https://github.com/lukas-reineke/virt-column.nvim/issues/2)
    vim.api.nvim_create_autocmd('ColorScheme', {
      command = 'highlight clear ColorColumn'
    })

    require('virt-column').setup {
      char = '│',  -- Default is '┃'; indent_blankline_char default is '│'
      exclude = { filetypes = {'toggleterm'} }
    }
  end
}
