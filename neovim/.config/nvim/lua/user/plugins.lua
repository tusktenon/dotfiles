-- Automatically install Packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically run `:PackerCompile` whenever `plugins.lua` is updated
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


return require('packer').startup(function(use)
  -- Let Packer manage itself
  use 'wbthomason/packer.nvim'

  -- Editor Enhancements
  use 'tpope/vim-surround'

  -- Colorschemes
  use 'arcticicestudio/nord-vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


-- vim: sw=2 ts=2 sts=2 et fdm=marker