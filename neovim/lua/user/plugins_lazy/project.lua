-- Project Management
return {
  'ahmedkhalf/project.nvim',
  config = function()
  require('project_nvim').setup {
    -- Don't calculate root for specific directories
    exclude_dirs = {'~/Development/dotfiles/neovim/.config/*'}
  }
  end
}
