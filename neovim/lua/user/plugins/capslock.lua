-- Software capslock; compare tpope/vim-capslock
return {
  'barklan/capslock.nvim',
  config = function()
    require("capslock").setup()
    vim.keymap.set({ "i", "c", "n" }, "<C-g>c", "<Plug>CapsLockToggle", {desc = 'Toggle Capslock'})
    vim.keymap.set('n', '<leader>tc', "<Plug>CapsLockToggle", {desc = 'Capslock'})
  end
}
