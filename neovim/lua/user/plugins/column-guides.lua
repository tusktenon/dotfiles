-- Column guides: use a character for the colorcolumn
return {
  'lukas-reineke/virt-column.nvim',
  opts = {
    char = '│',  -- Default is '┃'; indent_blankline_char default is '│'
    exclude = { filetypes = {'toggleterm'} }
  }
}
