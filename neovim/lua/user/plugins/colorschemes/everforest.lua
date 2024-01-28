-- My favourite scheme. Beautiful and practical.
return {
  'sainnhe/everforest',
  enabled = false,
  lazy = false,     -- main colorscheme should load during startup
  priority = 1000,  -- load colorscheme before all startup plugins
  config = function()
    vim.cmd 'source ~/.config/nvim/lua/user/plugins/colorschemes/everforest.vim'
    vim.cmd 'colorscheme everforest'
  end
}
